# Mount bootphon18 shortcuts
alias mount_root="sudo mount /dev/sda2 /mnt/old_root"
alias mount_home="sudo mount /dev/sda6 /mnt/old_home"

export HABILIS="129.199.81.135"
export DEV_API="https://coml.lscp.ens.fr/bigbaby/"
export API="https://api.babycloudlab.com/"
export OBERON='129.199.81.30'
export TITANIA='129.199.81.32'


# Functions

function deploy() {
	choice=""
	# Choose a server to redeploy
	case "$1" in
		("dev" | "d") # re-deploy devellopement server
			echo "redeploying dev server ...."
			vared -p "Continue (y/n)?" -c choice
			case "$choice" in
				y|Y )
					curl -X POST -F token=12243569f4ff40477b94066fdf3b9a -F "ref=master" -F "variables[API_HOME]=/babycloud/dev_home"\
					https://gitlab.coml.lscp.ens.fr/api/v4/projects/133/trigger/pipeline > /dev/null && echo "pipeline triggered successfully";;
				n|N ) echo -e "ok, bye...";;
				* ) echo "invalid option";;
			esac;;
		("prod" | "p") # re-deploy production server
			echo "redeploying production server ...."
			vared -p "Continue (y/n)?" -c choice
			case "$choice" in
			  y|Y )
				curl -X POST -F token=12243569f4ff40477b94066fdf3b9a -F "ref=master" -F "variables[API_HOME]=/babycloud/prod_home"\
				https://gitlab.coml.lscp.ens.fr/api/v4/projects/133/trigger/pipeline > /dev/null && echo "pipeline triggered successfully";;
			  n|N ) echo -e "ok, bye...";;
			  * ) echo "invalid option";;
			esac;;
		("local" | "l") # Deploy local server
			echo "redeploying local server ...."
			vared -p "Continue (y/n)?" -c choice
			case "$choice" in
				y|Y ) cd /serverFS
					make config
					make restart
					cd -;;
				n|N ) echo -e "ok, bye...";;
				* ) echo "invalid option";;
			esac;;
		(*) # default
			echo "No server specified"
			echo "Choices are : "
			echo -e "\t API : dev, prod, local";;
	esac
}

function pipeline() {
	curl --header "PRIVATE-TOKEN: fptc98jYzAnA9ESsV9Ss" https://gitlab.coml.lscp.ens.fr/api/v4/projects/133/pipelines | jq
}

function gitlab-upload() {
	curl --request POST --header "Private-Token: 12243569f4ff40477b94066fdf3b9a" --form "file=@$1" "https://gitlab.coml.lscp.ens.fr/api/v4/projects/MY_PROJECT_ID/uploads"


}


function log() {
	# choose a service to preview the logs
	case "$1" in
		("api") # preview api logs
			lnav /serverFS/log/api/api_log.log;;
		(*)
			echo "No option specified"
			echo "Choices are : "
			echo -e "\t LOG : api";;
	esac

}
