red() {
	git config --local user.name red
	git config --local user.email red@mail.com
    echo "-- User changed to Red"
}

blue() {
	git config --local user.name blue
	git config --local user.email blue@mail.com
    echo "-- User changed to Blue"
}

commit() {
	rm -rf *
	cp -r ../commits/commit$1/* .
  git add .
	git commit --allow-empty -m "Revision r$1"
  echo "-- Commit r$1"
}

branch() {
	git checkout $2 branch$1
}

merge() {
	git merge branch$1 --no-commit --strategy=ours
}

# setup 
rm -rf git
mkdir git
cd git
git init 

# commit 0
red
branch 0 -b
commit 0

# commit 1
branch 1 -b
commit 1

# commit 2
blue
branch 2 -b
commit 2

# commit 3
commit 3

# commit 4
red
branch 3 -b
commit 4

# commit 5
blue
branch 2
commit 5

# commit 6
branch 4 -b
commit 6

# commit 7
commit 7

# commit 8
red 
branch 3
commit 8

# commit 9
blue
branch 5 -b
commit 9

# commit 10
branch 6 -b
commit 10

# commit 11
red
branch 3
commit 11

# commit 12
blue
branch 7 -b
commit 12

# commit 13
branch 4
commit 13

# commit 14
branch 7
commit 14

# commit 15
branch 8 -b
commit 15

# commit 16
branch 4
commit 16

# commit 17
branch 2
commit 17

# commit 18
branch 8
commit 18

# commit 19
red
branch 0
commit 19

# commit 20
blue
branch 2
commit 20

# commit 21
branch 5
commit 21

# commit 22
red
branch 1
commit 22

# commit 23
blue
branch 6
commit 23

# commit 24
red
branch 1
commit 24

# commit 25
branch 3
commit 25

# commit 26
branch 1
commit 26

# commit 27
commit 27

# commit 28
commit 28

# commit 29
blue
branch 8
commit 29

# commit 30
branch 4
commit 30

# commit 31
branch 7
merge 4
commit 31

# commit 32
branch 6
commit 32

# commit 33
red
branch 0
commit 33

# commit 34
blue
branch 8
commit 34

# commit 35
branch 2
commit 35

# commit 36
red
branch 0
commit 36

# commit 37
blue
branch 7
commit 37

# commit 38
red
branch 0
merge 7
commit 38

# commit 39
blue
branch 2
commit 39

# commit 40
branch 8
commit 40

# commit 41
red
branch 0
commit 41

# commit 42
blue
branch 2
commit 42

# commit 43
red
branch 3
commit 43

# commit 44
branch 1
commit 44

# commit 45
blue
branch 2
commit 45

# commit 46
branch 6
commit 46

# commit 47
red
branch 3
merge 2
commit 47

# commit 48
blue
branch 8
commit 48

# commit 49
red
branch 1
merge 8
commit 49

# commit 50
blue
branch 2
commit 50

# commit 51
red
branch 1
commit 51

# commit 52
blue
branch 2
commit 52

# commit 53
red
branch 3
commit 53

# commit 54
commit 54

# commit 55
commit 55

# commit 56
branch 1
merge 3
commit 56

# commit 57
blue
branch 2
merge 1
commit 57

# commit 58
commit 58

# commit 59
branch 5
merge 2
commit 59

# commit 60
red
branch 0
merge 5
commit 60

# graph output
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
