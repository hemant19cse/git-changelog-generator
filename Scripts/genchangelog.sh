#!/bin/bash

#Read the config properties
. ./config.props

startTag=""
endTag=""
outputFormat="md"
if [ $# -eq 0 ]; 
then
    echo "USAGE: sh $0 tag1 tag2 [output format =  md | html]"
    exit -1
elif [ -z "$1" ] || [ -z "$2" ]
then
    echo "USAGE: sh $0 tag1 tag2 [output format =  md | html]"
    exit -1
fi
startTag=$1
endTag=$2

#If the user provides the output format as command line argument
if [ ! -z "$3" ]
then
    if [ "$3" == "md" ] || [ "$3" == "html" ]
    then
        outputFormat=$3
    else
        echo "*** Error => Unknown output format"
        echo "USAGE: output format can only be one of md or html"
        exit -1
    fi
fi

#File name with output format as file format
fileName=./$CHANGE_LOG_FILE_NAME"."$outputFormat

logChangesInMarkDownFormat() {
    feature="$1_title"
    featureTitle=${!feature}
    
    #Append changes for the category if there exists one. othewise header alone will be displayed
    changes=""
    if [ $CREATE_COMMIT_LINK == "true" ]
    then
        changes=`git log $startTag...$endTag --pretty=format:"- %s [$COMMIT_LINK_MSG]($PROJECT_COMMIT_BASE_URL%H)\n" | grep "#$1"`
    else
        changes=`git log $startTag...$endTag --pretty=format:'- %s \n' | grep "#$1"` >> ./$fileName
    fi

    if [ -z "$changes" ]; 
    then
        echo "There is no changes for category \"$1\""
    else
        #Append change category title
        echo "### $featureTitle" >> $fileName
        echo $changes >> $fileName
        echo "Changes for category \"$1\" has been tracked."
    fi

    #Remove the commit category tag from the change log
    sed -i '' -e "s/#$1//g" ./$fileName
    #Remove unwanted space before change for the category
    sed -i '' -e "s/ \-/\-/g" ./$fileName
}

logChangesInHTMLFormat() {
    feature="$1_title"
    featureTitle=${!feature}
    
    #Append changes for the category if there exists one. othewise header alone will be displayed
    changes=""
    if [ $CREATE_COMMIT_LINK == "true" ]
    then
        changes=`git log $startTag...$endTag --pretty=format:"<li>%s <a href=\"$PROJECT_COMMIT_BASE_URL%H\" target=\"_blank\">$COMMIT_LINK_MSG</a></li>\n" | grep "#$1"`
    else
        changes=`git log $startTag...$endTag --pretty=format:'<li>%s</li>\n' | grep "#$1"`
    fi

    if [ -z "$changes" ]; 
    then
        echo "There is no changes for category \"$1\""
    else
        #Append change category title
        echo "<h3>$featureTitle</h3>" >> $fileName 
        echo "<ul>" >> $fileName 
        echo $changes >> $fileName
        echo "</ul>" >> $fileName
        
        echo "Changes for category \"$1\" has been tracked."
    fi
    
    #Remove the commit category tag from the change log
    sed -i '' -e "s/#$1//g" ./$fileName
    #Remove unwanted space before change for the category
    sed -i '' -e "s/ \-/\-/g" ./$fileName
}

main() {
  
    if [ -f $fileName ]; 
    then
        echo "*** Error => Change log file:$fileName already exists"
        exit -1
    fi

    echo ""
    echo "*** Tracking changes ....."
    echo ""

    #Append the header title for the change log
    if [ $outputFormat == "md" ]
    then
        echo "# Change Log: $endTag" >> $fileName
    else
        echo "<h2>Change Log: $endTag</h2>" >> $fileName
    fi
    echo "" >> $fileName 

    #Generate change log for each of the category that need to be tracked
    for i in $(echo $TRACK_CHANGE_CATEGOTRIES | tr "," "\n")
    do
        if [ $outputFormat == "md" ]
        then
            logChangesInMarkDownFormat $i
        else
            logChangesInHTMLFormat $i
        fi
    done

    echo ""
    echo "*** Finished => Change log has been generated and saved in file: $fileName"
    echo ""
    
    exit 0
}

main *
