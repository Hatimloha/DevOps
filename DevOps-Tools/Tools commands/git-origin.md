# Git Workflow Documentation

This document outlines the steps to initialize a Git repository, link it to a remote GitHub repository, and push changes.

## Steps to Set Up Git and Push to GitHub

### 1. Initialize the Git repository
If you haven't already, initialize a new Git repository in your project directory:

```bash
git init
```
### 2 Add the remote origin (GitHub repository)
Link your local Git repository to the remote GitHub repository. Replace <https://github.com/repo> with your actual GitHub repository URL:
```bash
git remote add origin <https://github.com/repo>
```

### 3. Verify the remote repository
To verify that the remote repository has been added successfully, use the following command:
```bash
git remote -v
```
### 4. Stage all files for commit
Stage all modified or newly added files in your repository:
```bash
git add .
```

### 5. Commit your changes
Commit your staged changes with a meaningful message. For example:
```bash
git commit -m "Save all the files"
```

### 6. Push changes to the remote repository
Finally, push your changes to the main branch on GitHub:

```bash
git push origin main
```


Example:
```bash
# Clone your repository
git clone https://github.com/Hatimloha/Terraform-Learn.git
cd Terraform-Learn

# Add the remote for the other repository
git remote add terraform-zero-to-hero https://github.com/iam-veeramalla/terraform-zero-to-hero.git

# Fetch the contents
git fetch terraform-zero-to-hero

# Merge the content from the other repo's main branch
git merge terraform-zero-to-hero/main

# Push the changes
git push origin main
```
