#!/bin/bash

function exist(){
    if [ -e $1 ]
    then 
        return 1
    else
        echo "un des ficher en parametre est inexistant"
        return 0
    fi
}

function clean(){
    exist $1
    if [ $? ]
    then
        rm $(basename $1 .${1##*.})
    fi
}

function graphique(){

    ficher=""
    while [[ $ficher != "q" ]]
    do
        ficher=$(yad  --title "Compiler" \
	     --entry-label="enter le nom du ficher ou 'q' pour sortir :" \
	     --entry)
        
        echo $ficher
        exist $ficher
        
        if [[ $? && $ficher != "q" ]]
        then 
	    action=$(yad  --title "Compiler" \
	        --entry-label="Choose mode :" \
	        --entry "--debug" "--warni"\
                --button="compile:0" \
                --button="clean:1"  \
                --button="touch:2" \
                --button="Quit:3" )
        fi
             
        res=$?
        
        case $res in
            0)
                compile $action $ficher
            	;;
            1)
                clean $ficher
                ;;
            2)
                touch $ficher
                ;;
            3)
                break
                ;;
        esac
    done
}

function show_usage(){
    echo "compiler.sh : [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin"
}

function help(){


    echo ""                                                                               
                                                                               
    echo "     __     __     ______     __         ______     ______     __    __     ______    "   
    echo "    /\ \  _ \ \   /\  ___\   /\ \       /\  ___\   /\  __ \   /\ '-./  \   /\  ___\   "
    echo "    \ \ \/ '.\ \  \ \  __\   \ \ \____  \ \ \____  \ \ \/\ \  \ \ \-./\ \  \ \  __\   "  
    echo "     \ \__/'.~\_\  \ \_____\  \ \_____\  \ \_____\  \ \_____\  \ \_\ \ \_\  \ \_____\ "
    echo "      \/_/   \/_/   \/_____/   \/_____/   \/_____/   \/_____/   \/_/  \/_/   \/_____/ "
                                                                                  
                                                                               
    echo ""
    show_usage
    echo ""
    echo "utlisation : "
    echo "compiler.sh -h|--help"
    echo "compiler.sh --touch|--clear ficher.c ..."
    echo "compiler.sh [option ...] --cc fichier.c ... ou option est --debug|--optim|--warni"
    echo "compiler.sh -g"
    echo ""
    echo "Options : "
    echo ""
    echo "--touch : mettre à la date courante et affiche le nom du fichier"
    echo "--clean : supprimer le ficher executable des ficher en argument"
    echo "--cc    : compiler les fichers c  en argument selon le flag specifie" 
    echo "-g      : active le mode graphique"
    echo "-h ou --help : afficher le help du programme"
    echo "-v           : afficher la version et l'auteur du programme"
    echo "-m           : activer le mode menu textuel"
    echo ""
    echo "Flags : "
    echo ""
    echo "--debug : evoquer l'option -g de gcc"
    echo "--warni : evoquer l'option -W de gcc"
    echo ""
} 

function version(){
    echo "version 2.1"
    echo "ecrite par Haythem Jaidane et Nour ben Miled"
}

function verif(){

    if [ $1 -eq 1 ] 
    then
        echo "Pas d'argument"
        return 0
    else
        return 1
    fi
}

function touch_(){

    exist $1
    
    if [ $? -ne 0 ]
    then
    	echo $(basename $1 .${1##*.})
        touch -am $1
    	ls -l $1
    fi 
    
}

function compile(){

    exist $2
    
    if [ $? -ne 0 ]
    then
    	case $1 in
        --debug )
            gcc -g $2 -o $(basename $2 .${2##*.})
            ;;
        --warni )
            gcc -W $2 -o $(basename $2 .${2##*.})
            ;;
        esac
    fi

}


function menu(){

   clear

    echo "                 #######Menu#####                     "
    
    echo ""
    
    echo "	MMMMMMMMMMMMMMMWX0kkkk0XWMMMMMMMMMMMMMMM	"
    echo "	MMMMMMMMMMMWNKOkdooddoodkOKNWMMMMMMMMMMM	"
    echo "	MMMMMMMMWX0Oxdoddooddooddodxk0XWMMMMMMMM	"
    echo "	MMMMWNKOkddddddkkOO00OOkkdddoodkOKNWMMMM	"
    echo "	MMWKOxdooodxOKNWWMMMMMMWWNKOxdddodxk0NMM	"
    echo "	MMKxoooddx0NWMMMWWNNNNWWMMMWN0xdolc:cOWM	"
    echo "	MMKdooodkXWMMWX0OxxxxxxO0XWMMNOl;,'';kWM	"
    echo "	MMKdoookXMMMN0xdddddoddddxOOxl;,'''';kWM	"
    echo "	MMKdood0WMMNOdddddddooolc:;,'''''''';kWM	"
    echo "	MMKdooxXMMMXxooddoolc:;,'''''''''''';kWM	"
    echo "	MMKdooxKMMMNkoolc:;,'''''''''''''''';kWM	"
    echo "	MMKdoodOWMMWKo;,'''''''''';c:,'''''';kWM	"
    echo "	MMKdoddd0NMMWKd:,'''''',:dKNXOo,'''';kWM	"
    echo "	MMKdolc::dKWMMWX0kxddxk0XWMMWKo,'''';kWM	"
    echo "	MMXd:,''',:d0NWMMMMMMMMMMWN0d:,'''',lKMM	"
    echo "	MMWX0xl;'''';cdkOKKKKKKOkdc;''',;lx0NWMM	"
    echo "	MMMMMMNKko:,'''',,;;;;,,'''',:okKWMMMMMM	"
    echo "	MMMMMMMMMWXOdc;''''''''',;lx0XWMMMMMMMMM	"
    echo "	MMMMMMMMMMMMWNKko:,'',:okKNMMMMMMMMMMMMM	"
    echo "	MMMMMMMMMMMMMMMMWKxooxKWMMMMMMMMMMMMMMMM	"
    
    echo ""
    
    echo " Taper1 : -touch"
    echo " Taper2 : -clean"
    echo " Taper3 : -cc"
    echo " Taper4 : -g"
    echo " Taper5 : -h"
    echo " Taper6 : -v"
    echo " Taper0 : Quitter"
    
    read  -p " Entrez votre choix : " choix
}

ARGUMENT_LIST=(
  "help"
  "menu"
  "debug"
  "cc"
  "warni"
  "clean"
  "touch"
)


# read arguments
opts=$(getopt \
  --longoptions "$(printf "%s," "${ARGUMENT_LIST[@]}")" \
  --name "$(basename "$0")" \
  --options "mphvgl" \
  -- "$@"
)

eval set --$opts

verif $#
if [ $? -ne 0 ]
then
    case $1 in
    -h | --help )
        help
        ;;
     --debug | --warni )
        if [ $2 == "--cc" ]
        then
            compile $1 $4
        else
            echo "ERREUR D'UTILISATION !!!"
            echo ""
            help
        fi
        ;;
    -m )
        menu
        while [ $choix -ne 0 ]
        do
            case $choix in
                1)
                    read  -p " Entrez le chemin du ficher ou q pour quiter: " file
                    while [ $file != "q" ]
                    do
                        touch_ $file
                        read  -p " Entrez le chemin du ficher ou q pour quiter: " file
                    done
                    ;;
                2 )
                    read  -p " Entrez le chemin du ficher ou q pour quiter: " file
                    while [ $file != "q" ]
                    do
                        clean $file
                        read  -p " Entrez le chemin du ficher ou q pour quiter: " file
                    done
                    ;;
                3 )
                    read  -p " Entrez le chemin du ficher ou q pour quiter: " file
                    while [ $file != "q" ]
                    do  
                        echo "*************** menu ******************"
                        echo "1 ) debug"
                    	echo "2 ) warni"
                    	read -p "enter le numero du flag : " flag
                    	case $flag in
                            1 )
                            	compile --debug $file
                            	echo "compiled !" 
                            ;;	
                            2 )
                            	compile --warni $file
                            	echo "compiled !" 
                            ;;
                    	esac
                    	read  -p " Entrez le chemin du ficher ou q pour quiter: " file
                    done
                    ;;
                4 )
                    graphique
                    ;;
                5 )
                    help
                    ;;
                6 )
                    version
                    ;;
            esac  
            read  -p " clicker enter: " r              
            menu     
        done
        ;;
    -v )
        version
        ;;
    -g )
        graphique
        ;;
    --clean )
        clean $3
        ;;
    --touch )
        touch_ $3
        ;;
  esac
fi
