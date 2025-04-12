#Variables
REPO_URL="file:///D:/OPI/OPI_LAB2/svn/repo"
COMMITS="../../commits"
CURRENT_USER="red"

red() {
    CURRENT_USER=red
    echo "-- user changed to Red"
}

blue() {
    CURRENT_USER=blue
    echo "-- user changed to Blue"
}

commit() {
    if compgen -G "./*" > /dev/null; then
       svn rm --force ./*
    fi
    cp $COMMITS/commit$1/* .
    svn add * --force
    svn commit -m "r$1" --username $CURRENT_USER
    echo "Commit $1"
}

branch_from_trunk() {
	svn copy $REPO_URL/trunk $REPO_URL/branches/"$1" -m "Add branch $1" --username $CURRENT_USER
    echo "Branch $1 from trunk created"
}

branch() {
    svn copy $REPO_URL/branches/"$1" $REPO_URL/branches/"$2" -m "Add $2" --username $CURRENT_USER
    switch $2
    echo "New $2 from $1 created"
}

switch() {
	svn switch $REPO_URL/branches/"$1"
    echo "Switched to $1"
}

switch_to_trunk() {
	svn switch $REPO_URL/trunk
    echo "switched to trunk"
}

merge() {
	svn merge --accept working --non-interactive $REPO_URL/branches/"$1"
	svn resolved *
  echo "Merge from $1 to current branch"
}

#Init
rm -rf svn
mkdir svn
cd svn
pwd

svnadmin create repo
svn mkdir $REPO_URL/trunk $REPO_URL/branches -m "Init file structure" --username $CURRENT_USER

#Create working directory
svn checkout $REPO_URL/trunk wd
if [ ! -d wd ]; then
  echo "Ошибка: рабочая директория wd не создана. Возможно, ошибка в svn checkout."
  exit 1
fi
cd wd

#Commits

# commit 0
cp $COMMITS/commit0/* .
svn add * --force
svn commit -m "r0" --username $CURRENT_USER

# commit 1
branch_from_trunk branch1
commit 1

# commit 2
blue
branch branch1 branch2
commit 2

# commit 3
commit 3

# commit 4
red
branch branch2 branch3
commit 4

# commit 5
blue
switch branch2
commit 5

# commit 6
branch branch2 branch4
commit 6

# commit 7
commit 7

# commit 8
red
switch branch3
commit 8

# commit 9
blue
branch branch3 branch5
commit 9

# commit 10
branch branch5 branch6
commit 10

# commit 11
red
switch 3
commit 11

# commit 12
blue
branch branch3 branch7
commit 12

# commit 13
switch branch4
commit 13

# commit 14
switch branch7
commit 14

# commit 15
branch branch7 branch8
commit 15

# commit 16
switch branch4
commit 16

# commit 17
switch branch2
commit 17

# commit 18
switch branch8
commit 18

# commit 19
red
switch_to_trunk
commit 19

# commit 20
blue
switch branch2
commit 20

# commit 21
switch branch5
commit 21

# commit 22
red
switch branch1
commit 22

# commit 23
blue
switch branch6
commit 23

# commit 24
red
switch branch1
commit 24

# commit 25
switch branch3
commit 25

# commit 26
switch branch1
commit 26

# commit 27
commit 27

# commit 28
commit 28

# commit 29
blue
switch branch8
commit 29

# commit 30
switch branch4
commit 30

# commit 31
switch branch7
merge branch4
commit 31

# commit 32
switch branch6
commit 32

# commit 33
red
switch_to_trunk
commit 33

# commit 34
blue
switch branch8
commit 34

# commit 35
switch branch2
commit 35

# commit 36
red
switch_to_trunk
commit 36

# commit 37
blue
switch branch7
commit 37

# commit 38
red
switch_to_trunk
merge branch7
commit 38

# commit 39
blue
switch branch2
commit 39

# commit 40
switch branch8
commit 40

# commit 41
red
switch_to_trunk
commit 41

# commit 42
blue
switch branch2
commit 42

# commit 43
red
switch branch3
commit 43

# commit 44
switch branch1
commit 44

# commit 45
blue
switch branch2
commit 45

# commit 46
switch branch6
commit 46

# commit 47
red
switch branch3
merge branch2
commit 47

# commit 48
blue
switch branch8
commit 48

# commit 49
red
switch branch1
merge branch8
commit 49

# commit 50
blue
switch branch2
commit 50

# commit 51
red
switch branch1
commit 51

# commit 52
blue
switch branch2
commit 52

# commit 53
red
switch branch3
commit 53

# commit 54
commit 54

# commit 55
commit 55

# commit 56
switch branch1
merge branch3
commit 56

# commit 57
blue
switch branch2
merge branch1
commit 57

# commit 58
commit 58

# commit 59
switch branch5
merge branch2
commit 59

# commit 60
red
switch_to_trunk
merge branch5
commit 60

cd ..