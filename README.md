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

# Change Log: V1.1

### New Features:
-  New feature two [View Commit](https://github.com/hemant19cse/git-changelog-generator/commit/0fcf7456188af8444e510a508c87a4de5489ce24)
-  New feature One [View Commit](https://github.com/hemant19cse/git-changelog-generator/commit/a552f398bceb06978cf00c0aefdf246cddb1ccdc)

### Features Changed:
-  Feature two also changed [View Commit](https://github.com/hemant19cse/git-changelog-generator/commit/5e6e5443b37720615e3100f80e42a2096bf31e39)
-  Feature one changed [View Commit](https://github.com/hemant19cse/git-changelog-generator/commit/f4e06a1ca76dd22938db2114ac97fda8dc2637bc)

### Features Removed:
-  Feature two has been removed [View Commit](https://github.com/hemant19cse/git-changelog-generator/commit/36d22a11f51fdb374ca0fbb04497dac2fe4f5658)

### Performance Enhancements:
-  Both features has been enhanced [View Commit](https://github.com/hemant19cse/git-changelog-generator/commit/c280228a6390df5bf30972b030573ecc829a127d)
-  Major performance enhancements [View Commit](https://github.com/hemant19cse/git-changelog-generator/commit/1de4b0cc3c17123b618c4eca8fdf221972bf8ebd)


