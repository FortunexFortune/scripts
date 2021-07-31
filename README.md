# scripts
Compilation of scripts and utilities that are meant to be reused by other projects.

### Executing program

* git-tag.sh
    * Script used to increment the tag of your repo
```
bash <(curl -s https://raw.githubusercontent.com/FortunexFortune/scripts/v0.2.1/git-tag.sh --major)
bash <(curl -s https://raw.githubusercontent.com/FortunexFortune/scripts/v0.2.1/git-tag.sh --minor)
bash <(curl -s https://raw.githubusercontent.com/FortunexFortune/scripts/v0.2.1/git-tag.sh --bug)
bash <(curl -s https://raw.githubusercontent.com/FortunexFortune/scripts/v0.2.1/git-tag.sh --minor --bug)

curl -s http://server/path/script.sh | bash -s arg1 arg2

```

## TO-DO
* Figure out how to execute raw bash script from URLs with parameters 
* ENABLE branch protection for main or master
* Flash out the gitlab-terraform-init.sh script 

## Version History
* 0.1.0
    * Initial Release
    * See [commit change]() or See [release history]()