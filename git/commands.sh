git init #tells git that this folder is a project folder. It inserts a hidden folder that contains basic information.

git add #[file] #This adds a file to be saved to the project folder.
        #This is usually run with the whole directory being added at once [.]
        #this can also be used to delete files of the name listed.

git commit #[-m "your message here"] #saves the location of the directory.
git commit -a #This lets you skip adding files to staging, and goes straight to committing.
git commit --amend #This lets you re-commit something, just in case you forgot that one last thing.

git log #prints the log
git log -2 #shows just the last two entries.

git checkout #[file] without arguments, it lists available things to roll back, otherwise, it rolls back 1 or more listed files from a previous version.
  git checkout #[uuid] grab a commit from a specific point in time, but takes out any conflicting points in the future.
  #By defualt, files will be grabbed from the latest point in time, you will need to specify the point in time you wish to obtain in order to grab an older file.
git checkout -- ./file #This will undo changes you made to that file, and revert back to the ones from the last commit.

git reset #[file] undoes adding a specific file.

git reset --hard <uuid> #Deletes a commit. If this one had future commits after it, they also get deleted.

git rm #[file] #removes the file, and runs "git add" at the same time.

git branch #[ "name" [uuid] ]Creates a new branch to edit code seperately from master. without arguments, it lists current branches. with just a name, it creates a dedicated branch for editing.
  git branch -m #[branch] "new name" changes the name of a branch
  git branch -D #[branch] deletes listed branch
  
  
git merge #[branch] [anotherBranch] collects all changes from the listed branches, and moves them to the branch you are on right now.
git 

git status #tells what files have been changed. if you want a brief version, run:
git status -s

#to list all remote directories you have used in your git folder, type:
git remote # adding -v will show the full url.

#adding a remote repository:
git remote add shortName http://urlHere.com/

#getting something from a remote repository:
git fetch asdf

#pushing your code to a remote repository:
git push remoteRepository desiredBranch
#Sometimes you accidentally might make a commit in the wrong branch, to fix this, first delete the commit on your machine, then run this:
git push remoteRepository +desiredBranch
#The + forces it to sumbit your changes despite not being up to date.

#if you didn't mean to name a remote repo the current name, you change it via:
git remote rename <remote> <newName>

#removing something from the repository without deleting it locally:
git rm --cached fileName #add -r before the name so that it removes a directory.
