Vim�UnDo� �D��:��{�BgH�㤁�d���$(!�͙�      	            5       5   5   5    `zO   
 _�                            ����                                                                                                                                                                                                                                                                                                                                                             `zKt    �               git commit -m 'deploy'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �             5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �               	5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �               endif 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �               fi 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                fi5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                	5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �               �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `zK�     �                 	5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        `zK�     �               # abort on errors   set -e   # build   yarn run build   *# navigate into the build output directory   cd dist   )# if you are deploying to a custom domain   echo 'zion-english.com' > CNAME   git init   
git add -A   git commit -m $1   Ogit push -f https://github.com/flamendless/zion-english-vue.git master:gh-pages   D# git push -f https://github.com/flamendless/zion-english.git master   cd -5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        `zK�     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        `zK�     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        `zK�     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        `zK�     �                �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        `zK�     �               if [ $# -eq 0 ]5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �                	if [ $# -eq 0 ]; then   1		echo "arg1 is apk name; arg2 is keystore file;"   	else5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �               function deploy() 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �               function deploy() 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �               function deploy()5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �             �               {}5�_�       "           !   	        ����                                                                                                                                                                                                                                                                                                                            	                      V        `zK�     �      	          	# abort on errors   	set -e   	# build   	yarn run build   +	# navigate into the build output directory   	cd dist   *	# if you are deploying to a custom domain    	echo 'zion-english.com' > CNAME   		git init   	git add -A   	git commit -m $1   P	git push -f https://github.com/flamendless/zion-english-vue.git master:gh-pages   E	# git push -f https://github.com/flamendless/zion-english.git master   	cd -5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                            	           	           V        `zK�     �         	    �         	    5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                                  V        `zK�     �                 5�_�   #   %           $      	    ����                                                                                                                                                                                                                                                                                                                                                  V        `zK�     �               if [ $# -eq 0 ]; then5�_�   $   &           %      	    ����                                                                                                                                                                                                                                                                                                                                                  V        `zK�     �               if [ $# -neq 0 ]; then5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                  V        `zK�     �               if [ $# -eq 0 ]; then5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                  V        `zK�    �               	�             5�_�   '   )           (      	    ����                                                                                                                                                                                                                                                                                                                                                  V        `zK�     �               	�             5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                  V        `zK�    �               	�             5�_�   )   +           *      
    ����                                                                                                                                                                                                                                                                                                                                                             `zL    �               
	deploy();5�_�   *   ,           +           ����                                                                                                                                                                                                                                                                                                                                                             `zL0    �               function deploy()   {�               {5�_�   +   -           ,      	    ����                                                                                                                                                                                                                                                                                                                                                             `zL3    �               		deploy()5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                             `zM�    �               	git commit -m $15�_�   -   /           .           ����                                                                                                                                                                                                                                                                                                                                                             `zN�     �                �             5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                             `zN�     �               	git commit -m "$1"5�_�   /   1           0          ����                                                                                                                                                                                                                                                                                                                                                             `zN�     �               	�             5�_�   0   4           1      	    ����                                                                                                                                                                                                                                                                                                                                                             `zN�    �               
	msg = $1;5�_�   1   5   2       4          ����                                                                                                                                                                                                                                                                                                                                                             `zO     �               		msg = $15�_�   4               5          ����                                                                                                                                                                                                                                                                                                                                                             `zO   
 �               	msg= $15�_�   1   3       4   2          ����                                                                                                                                                                                                                                                                                                                                                             `zN�     �               	${msg} = $15�_�   2               3          ����                                                                                                                                                                                                                                                                                                                                                             `zN�   	 �               
	$msg = $15�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �              5�_�                             ����                                                                                                                                                                                                                                                                                                                                                V       `zK�     �              5��