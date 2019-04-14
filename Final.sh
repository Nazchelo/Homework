#! /bin/bash
clear
function Menu() { 
echo -e  "1. Create user\n2. Delete user\n3. Create group\n4. Delete group\n5. Edite user\n6. Show info\n0. Exit"
read choice
}
function Menu1(){
echo -e "1. NewGroupName\n2. ModGroup\n0. Exit"
read ChoiseGroup
}
function MenuInfo(){
echo -e "1. All Users.\n2. User by name.\n3. All Groups.\n4. Group by Name.\n0. Exit"
read ChoiseInfo
}
################################################
function Info(){
exit=true
while [ exit==true ]
do
MenuInfo;


case $ChoiseInfo in

			1)Alluser; ;;
			2)ByName; ;;
			3)AllGroup; ;;
			4)ByGroup; ;;
			0)return; Menu;;
			*)echo "R.T.F.M."; ;;

esac
done
}
############################
function Alluser(){
clear
echo "AllUsers - :"
less /etc/shadow
}
function AllGroup(){
clear
echo "ALLGroups - :"
less /etc/group
}
function ByName(){
clear
echo "Enter UserName:"
read FindUser
less /etc/shadow | grep $FindUser
}
function ByGroup(){
clear
echo "Group to find"
read FindGroup
less /etc/group | grep $FindGroup
}

#########################################################################################
function Menu2(){
echo -e "1. Edit Name.\n2. Edit UID.\n3. Edit GID.\n4. Edit Passwd.\n0. Exit"
read choiseedit
}
#########################################################################################
function CreateUser () {
clear
echo -e "1) Name\n2) Name + UID +GID"
read userChoice




	if  (($userChoice== 1 ))
	then
	echo "Enter username: "
	read newUserName
	useradd $newUserName
		if (($?==0))
		then echo "User create, choose passwd!"
	passwd $newUserName
	else 
		clear
		echo "Sorry, this User not free, choose something else"
		cat /etc/passwd | grep $newUserName
	fi





elif (( $userChoice == 2))
then 
	echo "User + UID + GID"
	read group2
	groupadd $group2
	read newUserName2
	useradd $newUserName2
	usermod $newUserName2 --gid $group 
fi	
}
###############################################################################
function AddGroup () {
echo "NewGroup Name"
read AddGroup
groupadd $AddGroup
if (($?==0))
 then echo "Group create"
else echo "choose other groupname"
fi
}
function ModGroup() {
echo "Whot name of group you wont to mod?"
read ModGroup
echo "New Name"
read NewGroup
groupmod $ModGroup -n $NewGroup
	if (($?==0))
	then echo "saccess rename"
	else echo "problem"
	fi

}
################################################################################
function ChoiseGroup (){
exit=true
while [ $exit==true ]
do
Menu1;
case $ChoiseGroup in
			1)AddGroup; ;;
			2)ModGroup; ;;
			0)return; Menu; ;;
			*)echo "R.T.F.M."; ;;
esac
done




 
}
#########################################################################################
function DeleteUser() {
echo "What UserName you wont to Delete "
read userDelete
userdel $userDelete
}
###########################################################################
function DeleteGroup(){
echo "Whot GroupName you wont to delete"
read namedelgroup
groupdel $namedelgroup
	if (($?==0))
	then echo "succsess delete"
	else echo "Sorry, $namedelgroup groupname not found" 
	fi
}

###########################################################################



###########################################################################
function EditName(){
echo "Whot UserName you wont to edit?"
read EditName
echo "enter new Name"
read newName
usermod $EditName -l $newName
	if (($?==0))
	then echo "succsess rename"
	else echo "User not found"
	fi
}
function EditUID(){
echo "Whot User you wont to edit UID?"
read UsereditUID
echo "enter your new UID for $UsereditUID"
read newUID
usermod $UsereditUID -u $newUID
	if (($?==0))
	then echo "success"
	else echo "This User or UID dont exist"	
fi

}
function EditGID(){
echo "enter Username to rename GID"
read usernamegid
echo "enter new GID for $usernamegid"
read newGID
usermod $usernamegid -g $newGID
	if (($?==0))
	then echo "success rename GID"
	else echo "problem"
	fi

}
function EditPasswd(){
echo "User to edit pass"
read userforpass
passwd $userforpass
	if (($?==0))
	then echo "success pass edit"
	else "problem"
	fi
}
###########################################################################
function EditUser(){
exit=true
while [ exit==true ]
do
Menu2;
case $choiseedit in
	1)EditName; ;;
	2)EditUID; ;;
	3)EditGID; ;;
	4)EditPasswd; ;;
	0)return; ;;
	*)echo "R.T.F.M."; ;;

esac
done
}
###########################################################################
exit=true

while [ $exit==true ]
do
Menu;
case $choice in
	1)CreateUser; ;;
	2)DeleteUser; ;;
	3)ChoiseGroup; ;;
	4)DeleteGroup; ;;
	5)EditUser; ;; 
	6)Info; ;;
	0)echo "Bye!!!";clear; ;;
	*)echo "R.T.F.M."; ;;
esac
done
