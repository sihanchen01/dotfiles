# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export _PP_TOKEN="0WJhLYkBPn-sZEkDdeKJMzYmk0A9tsaJHwp5d9MQbMUM"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  zsh-syntax-highlighting 
  fast-syntax-highlighting 
  zsh-autocomplete
  zsh-autosuggestions 
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias tf="terraform"
alias ll="ls -lart"
alias code="/Users/p1362005/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcubd="docker-compose up --build -d"
alias dcd="docker-compose down"
alias dcdv="docker-compose down -v"

function pycharm(){
    open -a "PyCharm" "$1"
}

function goland(){
    open -a "GoLand" "$1"
}

function idea(){
    open -a "IntelliJ IDEA" "$1"
}

# alias python="python3"
# alias pip="pip3"
#


source ~/.kubectl_aliases
alias kb="kubebuilder"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# z jump, cd
. /Users/p1362005/homebrew/etc/profile.d/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH
export PATH=/Users/p1362005/homebrew/bin:$PATH
export PATH=/Users/p1362005/bin:$PATH
export PATH=/Users/p1362005/nvim-macos/bin:$PATH
export PATH="$PATH:$(go env GOPATH)/bin"

alias azdev='az account set --subscription "98fd0a2b-3845-46ae-8800-528bcacb0484"'
alias azsit='az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"'

function lqbvm () {
    resource_id="/subscriptions/c24baf0d-aa7e-4163-9da5-223f0cf2793e/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-dev-sea-01/providers/Microsoft.Compute/virtualMachines/LQBDEVAPPLZ001"

    az account set --subscription "98fd0a2b-3845-46ae-8800-528bcacb0484"

    az network bastion ssh \
        --name "singtel-git-ti-bst-dev-sea-01" \
        --resource-group "singtel-git-ti-bst-dev-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type password \
        --username appuser
}

function devvmpwd () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    if [[ -n $3 ]];then
        SSH_KEY=$3
    else
        SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_dev"
    fi

    echo "${GREEN}Attempt to Password login as user $ssh_user${NC}"

    resource_id="/subscriptions/c24baf0d-aa7e-4163-9da5-223f0cf2793e/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-dev-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "98fd0a2b-3845-46ae-8800-528bcacb0484"
    az network bastion ssh \
        --name "singtel-git-ti-bst-dev-sea-01" \
        --resource-group "singtel-git-ti-bst-dev-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type password \
        --username $ssh_user

}



function devvm () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    if [[ -n $3 ]];then
        SSH_KEY=$3
    else
        SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_dev"
    fi

    echo "${GREEN}Attempt to SSH login as user $ssh_user${NC}"
    echo "${GREEN}SSH key: $SSH_KEY ${NC}"

    resource_id="/subscriptions/c24baf0d-aa7e-4163-9da5-223f0cf2793e/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-dev-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "98fd0a2b-3845-46ae-8800-528bcacb0484"
    az network bastion ssh \
        --name "singtel-git-ti-bst-dev-sea-01" \
        --resource-group "singtel-git-ti-bst-dev-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key $SSH_KEY

}


function devvmtunnel () {
    resource_id="/subscriptions/c24baf0d-aa7e-4163-9da5-223f0cf2793e/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-dev-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "98fd0a2b-3845-46ae-8800-528bcacb0484"
    echo "${GREEN}Attempt to Create SSH tunnel to $1"


    az network bastion tunnel \
        --port 50022 \
        --resource-port 22 \
        --name "singtel-git-ti-bst-dev-sea-01" \
        --resource-group "singtel-git-ti-bst-dev-sea-01" \
        --target-resource-id "$resource_id"

}

function tunnel_exec () {
    if [[ $# != 2 ]];then
        echo "[ERROR] Missing arguments..."
        echo "Usage: tunnel_exec <ssh_key> <cmd>"
        return
    fi
    echo "Executing SSH command as packer user via tunnel (localhost:50022): $2"
    ssh -i $1 packer@localhost -p 50022 $2
}

function tunnel_scp () {
    if [[ $# != 2 ]];then
        echo "[ERROR] Missing arguments..."
        echo "Usage: tunnel_scp <ssh_key> <file>"
        return
    fi
    echo "Using SSH tunnel to SCP file $2 to /home/packer"
    scp  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i $1 -P 50022 $2 packer@localhost:/home/packer
}

function sitvm () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    if [[ -n $3 ]];then
        SSH_KEY=$3
    else
        SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_sit"
    fi

    # SSH_KEY="/Users/p1362005/Downloads/coreeng_rsa"
    echo "${GREEN}Attempt to SSH login as user $ssh_user, using key $SSH_KEY${NC}"

    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key $SSH_KEY
}

function mecvm () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    if [[ -n $3 ]];then
        SSH_KEY=$3
    else
        SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_mec"
    fi

    # SSH_KEY="/Users/p1362005/Downloads/coreeng_rsa"
    echo "${GREEN}Attempt to SSH login as user $ssh_user, using key $SSH_KEY${NC}"

    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key $SSH_KEY
}


function mec2vm () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    if [[ -n $3 ]];then
        SSH_KEY=$3
    else
        SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_mec2"
    fi

    # SSH_KEY="/Users/p1362005/Downloads/coreeng_rsa"
    echo "${GREEN}Attempt to SSH login as user $ssh_user, using key $SSH_KEY${NC}"

    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key $SSH_KEY
}


function uatvm () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_uat"
    echo "${GREEN}Attempt to SSH login as user $ssh_user, using key $SSH_KEY${NC}"

    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key $SSH_KEY
}


function petvm () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_pet"
    echo "${GREEN}Attempt to SSH login as user $ssh_user, using key $SSH_KEY${NC}"

    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key $SSH_KEY
}


function pptvm () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    SSH_KEY="/Users/p1362005/.ssh/pmx_rsa_ppt"
    echo "${GREEN}Attempt to SSH login as user $ssh_user, using key $SSH_KEY${NC}"

    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key $SSH_KEY
}


function adsit () {
    echo "${GREEN}Attempt to AD login..."

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1" \
        --auth-type password \
        --username sihan.chen@singtel.com
}



function avmdev () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    echo "${GREEN}Attempt to SSH login as user $ssh_user${NC}"

    resource_id="/subscriptions/0b9b0115-8537-42cd-8427-404d2ad29ae3/resourceGroups/rg-singtel-git-consumer-pmx-cmpt-dev-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "98fd0a2b-3845-46ae-8800-528bcacb0484"
    az network bastion ssh \
        --name "singtel-git-ti-bst-dev-sea-01" \
        --resource-group "singtel-git-ti-bst-dev-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key /Users/p1362005/.ssh/pmx_rsa_dev

}



function sitaad () {
    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourcegroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/microsoft.compute/virtualmachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id"  \
        --auth-type AAD
}

function sitpid () {
    azsit && az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-cmpt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"  \
        --auth-type password \
        --username p1362005@singtel.corp.root
}


function sitvmss () {
    if [[ -n $2 ]];then
        ssh_user=$2
    else
        ssh_user="sinwrk1"
    fi

    echo "${GREEN}Attempt to SSH login as user $ssh_user${NC}"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$1" \
        --auth-type ssh-key \
        --username $ssh_user \
        --ssh-key /Users/p1362005/Downloads/coreeng_rsa
}


function sitvmsstunnel () {
    echo "${GREEN}Creating tunnel...${NC}"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion tunnel \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$1" \
        --resource-port "22" \
        --port "5022"
}


# Function - Azure Packer VM SSH
function packervm () {
    SSH_KEY=~/.ssh/pmx_rsa_pet

    echo "${GREEN}Attempt to SSH login as user packer${NC}"
    echo "${GREEN}SSH key: $SSH_KEY ${NC}"

    resource_id="/subscriptions/27849ec1-abbd-4dd3-8a8b-1d3c0992ff7c/resourceGroups/rg-singtel-sg-cbs-pmx-mgmt-nprd-sea-01/providers/Microsoft.Compute/virtualMachines/$1"

    az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
    az network bastion ssh \
        --name "singtel-git-ti-bst-nprd-sea-01" \
        --resource-group "singtel-git-ti-bst-nprd-sea-01" \
        --target-resource-id "$resource_id" \
        --auth-type ssh-key \
        --username packer \
        --ssh-key $SSH_KEY
}


# Function - Singtel daily journel
function startDailyJournal () {
    today=$(date +%d-%b-%Y)
    filepath=/Users/p1362005/notes/2024-notes/$(date +%m-%b)
    filename=$filepath/$today.md
    cd $filepath
    if [ -f $filename ] 
    then
        echo "File already exist!"
    else
        echo "Creating daily journal for $today..."
        cp /Users/p1362005/notes/daily-journal-template.md $filename;
    fi
    echo "Starting nvim in 1s..."
    sleep 1
    vim $filename
}

# AutoSuggestion
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"

# CLI vi-mode indicator
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Function weather
function weather () {
    if (($# == 0)) then
        echo "Showing weather in SG...";
        curl wttr.in/Singapore;
    else
        echo "Showing weather in $1...";
        curl wttr.in/$1;
    fi
} 

# get node name
function getPuppetNodeName () {
    
    curl -k --location --globoff "https://pupprdmasls001.cloudsg1.sg.singtelgroup.net:8081/pdb/query/v4/facts/hostname/$_PP_HOST_NAME" --header "X-Authentication:$_PP_TOKEN"
}

# Function PuppetTask
function execPuppetJob () {
    curl --insecure --header "$_PP_TYPE_HEADER" --header "$_PP_AUTH_HEADER" --request POST "$_PP_URI" --data "$_PP_DATA"
}

function getPuppetTaskLog () {
    if ! [ -f /Users/p1362005/puptasklog/puptask-$_PP_TASK_ID.json ];then
        curl -k --location --globoff "https://pupprdmasls001.cloudsg1.sg.singtelgroup.net:8143/orchestrator/v1/jobs/$_PP_TASK_ID/events" --header "X-Authentication:$_PP_TOKEN" \
        > /Users/p1362005/puptasklog/puptask-$_PP_TASK_ID.json;
    fi

    echo "\n${GREEN}Puppet Task Output:${NC}"
    echo $(cat /Users/p1362005/puptasklog/puptask-$_PP_TASK_ID.json | jq '.items[] | select(.type == "node_finished") | .details.detail._output') | tr -d '"'
}

function puppetTask () {
    _PP_URI="https://pupprdmasls001.cloudsg1.sg.singtelgroup.net:8143/orchestrator/v1/command/task"
    _PP_TYPE_HEADER="Content-Type: application/json"
    _PP_TOKEN=''

    for arg in "$@"
    do
        case $arg in
            --token=*)
            _PP_TOKEN="${arg#*=}"
            shift
            ;;
            --hostname=*)
            _PP_HOST_NAME="${arg#*=}"
            shift
            ;;
            --command=*)
            _PP_COMMAND="${arg#*=}"
            shift
            ;;
            --log-wait=*)
            _PP_LOG_WAIT="${arg#*=}"
            shift
            ;;
            *)
            ;;
        esac
    done

    echo "${GREEN}Getting nodeName for host: $_PP_HOST_NAME ...${NC}"
    _PP_NODES=$(getPuppetNodeName $_PP_HOST_NAME $_PP_TOKEN | jq -r '.[].certname')
    _PP_AUTH_HEADER="X-Authentication: ${_PP_TOKEN}"
    _PP_DATA="{\"task\" : \"forged::run_command\", \"params\" : { \"command\": \"${_PP_COMMAND}\" }, \"scope\" : { \"nodes\" : [\"${_PP_NODES}\"] }}";

    echo "${GREEN}Executing Puppet Job on node: $_PP_NODES ...${NC}"
    _PP_TASK_ID=$(execPuppetJob | jq -r .job.name) 
    echo "${GREEN}Sleep for $_PP_LOG_WAIT seconds for job to complete...${NC}"
    sleep $_PP_LOG_WAIT
    echo "${GREEN}Retriving output for task: $_PP_TASK_ID ...${NC}"
    getPuppetTaskLog
}

# Set Singtel Cert, required for az login behind Zscaler proxy
export REQUESTS_CA_BUNDLE=~/ca-with-zscaler.pem

# Function azlogin
function azlogin {
    # set sub id
    echo -n "Which Env(dev, nprd)? "
    read  azure_env 
    while [[ "$azure_env" != "dev" && "$azure_env" != "nprd" ]];
    do
        echo "${RED}Invalid input! (Acceptable value: 'dev', 'nprd')${NC}"
        echo -n "Which Env(dev, nprd)? "
        read  azure_env 
    done
    if [ -z "${azure_env}" ]; then
        echo "${RED}Missing environment!${NC}"
    elif [ "$azure_env" = "dev" ]; then
        az account set --subscription "98fd0a2b-3845-46ae-8800-528bcacb0484"
        echo "${GREEN}az account set to DEV subscription!\n${NC}"
    elif [ "$azure_env" = "nprd" ]; then
        az account set --subscription "7958aada-8aab-4175-96f3-d0b0a83a5b63"
        echo "${GREEN}az account set to NP subscription!\n${NC}"
    else
        echo "${RED}something is wrong...${NC}"
        exit 0
    fi

    # login
    echo -n "Enter VM's resource id: "
    read  resource_id 
    echo "==="
    if [ -z "${resource_id}" ];
    then
        echo "${RED}Missing value, need a VM Resource ID!${NC}\n\nExample usage:\n  azlogin [VM_sub_id]"
    else
        echo "Connecting to <$resource_id> ..."
        az network bastion ssh --name "singtel-git-ti-bst-$azure_env-sea-01" --resource-group "singtel-git-ti-bst-$azure_env-sea-01" --target-resource-id "$resource_id" --auth-type "AAD"
    fi
}

function ppjoblog {
    curl -k --location  --globoff "https://pupprdmasls001.cloudsg1.sg.singtelgroup.net:8143/orchestrator/v1/jobs/$1/events" --header 'X-Authentication:AM8oO-IolmiFAdvD8WGFXoqBAm1VUdNRmd1TWMInPPQt' > ppjob$1.json
}

function forkrepo {
    git clone https://bitbucket.dev.aws.singtel.com/scm/~sihan.chen_singtel.com/$1.git
        # && /Users/p1362005/Downloads/VSCode.app/Contents/Resources/app/bin/code $1
}

function updatepwd {
    security delete-generic-password -a "$USER" -s "singtelpwd" || true
    echo -n "Enter your password (base64): " 
    read pwd64
    security add-generic-password -a "$USER" -s "singtelpwd" -w "$pwd64"
    pwd=$(security find-generic-password -a "$USER" -s "singtelpwd" -w | base64 -d)
    echo "Now yourpassword is: $pwd"
}


# Proxy       singtelproxy2.net.vic:80
# Proxy		singtelproxy.net.vic:80
# Proxy		10.142.90.220:80
# Proxy		10.92.1.220:80

export http_proxy="http://p1362005:"$(security find-generic-password -a "$USER" -s "singtelpwd" -w | base64 -d)"@singtelproxy2.net.vic:80"
export ALL_PROXY=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy
export NO_PROXY=127.0.0.1,localhost,192.168.49.2,10.96.0.0/12,192.168.59.0/24,192.168.39.0/24

# Azure CLI autocompletion
# autoload bashcompinit && bashcompinit
# source $(brew --prefix)/etc/bash_completion.d/az

alias awsToken='head -n 5  ~/.aws/credentials > ~/.aws/credentials1.bak; mv ~/.aws/credentials1.bak ~/.aws/credentials; aws sts assume-role --role-arn "arn:aws:iam::473076588230:role/dev" --role-session-name "AWSCLI-Session" --profile dev --duration-seconds 3600 | egrep "AccessKeyId|SecretAccessKey|SessionToken"|sed "s/^        \"AccessKeyId\": \"/aws_access_key_id = /;s/^        \"SecretAccessKey\": \"/aws_secret_access_key = /;s/^        \"SessionToken\": \"/aws_session_token = /;s/\",$//" >> ~/.aws/credentials'


# Homebrew
eval "$(/Users/p1362005/homebrew/bin/brew shellenv)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export bamboo_nexus_username="svc_it_puppet_cmdb_bcc_oms"

export bitbucket_username="sihan.chen@singtel.com"


export DOCKER_BUILDKIT=0


# claude code
export NODE_EXTRA_CA_CERTS=/Users/p1362005/.ssh/ZscalerRootCA.pem

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias claude="/Users/p1362005/.claude/local/claude"
