git_Add_Commit_Push() {
	echo "*******************************"
	echo $1
	
	cd $1
    git add . 
    git commit -m "$commit"

	echo " "
	echo "!!!pushing to origin ..."
    git push origin master
	
	if [ "$pushToGithub" == "y" ]; then
		echo " "
		echo "!!!pushing to github ..."
		git push origin.github master
	fi
	
	echo " "
	echo " "
}

git_Add_Commit_Push_forAll() {
	read -e -p "Input your comment for commit: " commit
	read -p "push to github? (y means yes, other means no.)" pushToGithub

	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/00_ScadaCore &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/01_ScadaProject/01_FormProjectNetCoreTemplate &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/01_ScadaProject/02_FormProjectNetFrameworkTemplate &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/01_ScadaProject/03_WpfProjectNetCoreTemplate &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/01_ScadaProject/04_WpfProjectNetFrameworkTemplate &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/03_ScadaControler/01_Omron.FinsPlc &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/03_ScadaControler/02_Epson.Rc7 &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/04_ScadaUi.Form &
	git_Add_Commit_Push D:/Jame/01_project/17_SCADA/05_ScadaUi.Wpf &
}


git_status() {
	echo "*******************************"
	echo $1
	
	cd $1
    git status

	echo " "
	echo " "
}

git_status_forAll() {
	git_status D:/Jame/01_project/17_SCADA/00_ScadaCore 
	git_status D:/Jame/01_project/17_SCADA/01_ScadaProject/01_FormProjectNetCoreTemplate 
	git_status D:/Jame/01_project/17_SCADA/01_ScadaProject/02_FormProjectNetFrameworkTemplate 
	git_status D:/Jame/01_project/17_SCADA/01_ScadaProject/03_WpfProjectNetCoreTemplate 
	git_status D:/Jame/01_project/17_SCADA/01_ScadaProject/04_WpfProjectNetFrameworkTemplate 
	git_status D:/Jame/01_project/17_SCADA/03_ScadaControler/01_Omron.FinsPlc 
	git_status D:/Jame/01_project/17_SCADA/03_ScadaControler/02_Epson.Rc7 
	git_status D:/Jame/01_project/17_SCADA/04_ScadaUi.Form 
	git_status D:/Jame/01_project/17_SCADA/05_ScadaUi.Wpf 
}


git_status_forAll

read -p "git current version? (y means yes, other means no.)" gitCurrentVersion
if [ "$gitCurrentVersion" == "y" ]; then
	git_Add_Commit_Push_forAll
fi

read -p "press any key to continune"

