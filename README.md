**Git Change Log Generator**
---

Change Log Generator let's a git user generate change log from the existing commit log between any two commit tags.

**How to use:**
---

* Download/Clone ChangeLogGenerator
* Copy git directory to your existing git repository
* Update your repository commit base url in config.props - PROJECT_COMMIT_BASE_URL
* Execute git pull to ensure you have the latest commit logs in local repository
* Execute sh genchangelog.sh tag1 tag2
* Change log will be genated and added in the file - GENERATED_CHNAGELOG.MD

**How it works:**
It uses some predefined tags which can be added in commit message, ex. - #feature when one commits the code the repository.

Note: You can also create your own favorite tag and use that in the commit message. Just add the category tag in config.props -> TRACK_CHANGE_CATEGOTRIES and also add title to be used for the added category.

**Sample Generated Change Log**


