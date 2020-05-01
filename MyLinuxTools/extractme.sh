#!/bin/bash 

echo " ###########################################################"
echo "#    by : SoufElhabti                                     #"
echo "#   i can extract every file                              #"
echo "###########################################################"

file=$1
if file --mime-type "$file" | grep -q zip$; then
  echo "lets unzip ur file ";
  unzip $file ;
else
  if file --mime-type "$file" | grep -q gzip$; then
  	echo "lets gzip -d ur file ";
  	gzip -d $file ;
  
  else
	if file --mime-type "$file" | grep -q xz$; then
		echo "lets xz -d ur file ";
		xz -d $file ;
	else
		if file --mime-type "$file" | grep -q bzip2$; then
			echo "lets bunzip2 ur file";
			bunzip2 $file ;
		else 
			if file --mime-type "$file" | grep -q tar$; then
				echo "tar -xvf ur file " ;
				tar -xvf $file ;
			fi
		fi
	fi
	
  fi	
fi

