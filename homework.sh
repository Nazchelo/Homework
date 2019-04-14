#! /bin/bash
clear
##################################################
function Menu(){
echo -e "1. Change owner.\n2. Change permition.\n3. Information.\n0. Exit.\n"
read choice

} 
##################################################
function change_owner(){
clear
echo "UserName to edit:"
read UserName;
echo "GroupName to edit:"
read GroupName;
echo "FileName to edit" 
read FileName;
chown $UserName:$GroupName -R $FileName
if (($?==0)) 
	then
	echo "success edit"
	else 
	echo "error"
fi
}
###################################################
function change_permition(){
clear
exit=true
while [ $exit==true ]
do
permition;
case $my_choice in
        1)add_rights; ;;
        2)take_away_access_rights; ;;
        0)clear; return; ;;
	*)echo "R.T.F.M."; ;;
esac
done
}
function permition(){
echo -e "1. Add rights.\n2. Take away access rights.\n0. Exit.\n"
read my_choice
}
###################################################


##################################################
function add_rights(){
echo "U or G or O"
read  your_choise;
echo "R or W or  X "
read privil_to_choise;
echo "File to change";
read File_to_choise;
chmod $your_choise+$privil_to_choise $File_to_choise
}
#################################################
function take_away_access_rights(){
echo "U or G or O"
read  your_choise;
echo "R or W or  X "
read privil_to_choise;
echo "File to change";
read File_to_choise;
chmod $your_choise-$privil_to_choise $File_to_choise

}
##################################################
function inform(){
clear
echo "whitch file access you wont to see: "
read myfile_name
ls -l $myfile_name
}
###################################################
exit=true

while [ $exit==true ]
do
Menu;
case $choice in
	1)change_owner; ;;
	2)change_permition; ;;
	3)inform; ;;
	0)clear; echo "Bye!!!"; exit; ;;
	*)echo "R.T.F.M."; ;;
esac
done
##################################################

