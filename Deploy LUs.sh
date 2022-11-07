#proj=
fabric_scripts_dir=/usr/local/k2view/fabric/scripts/
#path of the project + WS directory
LU_dir=$proj+'/Implementation/LogicalUnits'
#var for deployment success/fail
LU_Deploy=False
#list of LU Directorys
LU_list=arr()
#numbers of tries for Deployment
tries_number=3

#check if the directory "LogicalUnits" exist
if [ -d $LU_dir]
then
    cd $LU_dir  
    str=$(ls -d */)
    str2=${str//'/'/}
    IFS=' ' read -r -a array <<< $str2
    len=${#array[@]}
    for ((loop=0; loop<=$len; loop++));
    do
        if [${array[$loop]} == "k2_ws" || ${array[$loop]} == "TDM_LIBRARY"]
        then
            continue
        else
        for i in {1..$tries_number}
        do    
            try{    
                ./buildAndDeployArtifacts.sh -pd $proj -l ${array[$loop]}
                ENV_Deploy=true
            }
            catch (Throwable e) {
                if [i == $tries_number]
                then
                    echo "LU deploy failed for LU ${array[$loop]}, error: $e"
            }
            if [LU_Deploy=True]
            then
                break
            fi    
        done
    done
else
    echo "Error: Directory $LU_dir does not exists."
    break
fi

#check if LU deployed
LU_numbers=echo 'list lut;' | fabric | wc -l
if [$LU_numbers > 4]
then
    echo 'list lut;' | fabric | awk '{print $1}' | cut -d '|' -f2 | head -n ($LU_numbers -2)
else
    echo "Deploy LU failed"
    break
fi



