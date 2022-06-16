NODE_NAME="EXAMPLE"
NODE_VERSION="---"
NODE_PORTS="80 443 5000"

echo '\033[1;32m Node manager \033[0m'
PS3='Please enter your choice: '
options=("Install" "Update" "Delete" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install")
            installNode
            break
            ;;
        "Update")
            updateNode
            break
            ;;
        "Delete")
            deleteNode
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

function install{
    wget ./utils/logo.sh
}
function update{}
function delete{}
function check{}
function _prepare{}
