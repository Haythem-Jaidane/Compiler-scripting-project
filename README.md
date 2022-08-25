# Compiler (scripting project)

C programming language is compiled programming language. the most famous compiler is gcc. 
the problem is gcc is hard to use by beginners because it is console commande that new
linux user not familier with this type of programme.

## Installation

Use clone option of git CLI to clone the Repositories of the script

```bash
git clone https://github.com/Haythem-Jaidane/Compiler-scripting-project.git
```

## Usage

### Before using the script

update apt-get command
```bash
sudo apt-get update
```
install yad pakage that the graphical mode of script is based on
```bash
sudo apt-get -y install yad
```
change permission and give execute permission
```bash
sudo chmod 777 compiler.sh
```
### Display the help menu
```bash
./compiler.sh -h
```
### Display the graphical mode
```bash
./compiler.sh -g
```
### Display the menu mode
```bash
./compiler.sh -m
```
### Compile C file(s)
```bash
./compiler.sh [option] --cc file1.c [file2.c ...]
```
options : --debug|--optim|--warni

### Delate executable file(s) of compiled C file(s)
```bash
./compiler.sh --clean file1.c [file2.c ...]
```
### Update modification date of C file(s)
```bash
./compiler.sh --touch file1.c [file2.c ...]
```

## Coded By

### Haythem Jaidane : 


(Image/linkedIn.png)[Haythem Jaidane](https://tn.linkedin.com/in/haythem-jaidane)
(Image/github.png)[Haythem Jaidane](https://github.com/Haythem-Jaidane)

### Nour Ben Miled :
