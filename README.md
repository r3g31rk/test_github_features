# test_github_features
This repo is a Proof Of Concept of several Github's features

- Issues templates
    - Forms
    - Report

(.github/ISSUE_TEMPLATE/error-form.yml)
(.github/ISSUE_TEMPLATE/error-report.md)
(.github/ISSUE_TEMPLATE/upgrade-request.md)


# WIP
## Broken link checker
what I need inside a repo A:

- an action from the github marketplace, such as mlc or lychee
- a custom made solution  (can take some time) with
    - .dockerignore, 
    - Dockerfile, 
    [workflows/build.yml](https://github.com/Epitech/md-converter/blob/master/.github/workflows/build.yml) => IMAGE_NAME: docker-link-checker)
    - script.py, 

Wat I need inside this (or any other) repo B

- [workflows/broken_link_checker](https://github.com/Epitech/D-TMP-000/blob/main/.github/workflows/convert.yml)

