Vim�UnDo� ��k�b�h2�r"[���z�8�T�iM�q��lZM                                    `���    _�                            ����                                                                                                                                                                                                                                                                                                                                                             `���     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `���     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `���     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `���     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `���     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        `���     �                 if not strict.defined[k] then   4    error("cannot get undefined variable: " .. k, 2)     end5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  V        `���     �               if not strict.defined[k] then   0error("cannot get undefined variable: " .. k, 2)   end5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  V        `���     �               if not strict.defined[k] then   0error("cannot get undefined variable: " .. k, 2)   end5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                  V        `���     �               1	error("cannot get undefined variable: " .. k, 2)5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                  V        `���     �               2  error("cannot set undefined variable: " .. k, 2)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        `���     �               0error("cannot set undefined variable: " .. k, 2)5�_�                           ����                                                                                                                                                                                                                                                                                                                            	                    V       `���     �      
           for k, v in pairs(t) do       strict.defined[k] = true       rawset(_G, k, v)     end5�_�                            ����                                                                                                                                                                                                                                                                                                                            	                    V       `���     �      
         for k, v in pairs(t) do   strict.defined[k] = true   rawset(_G, k, v)   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                       	           V        `���     �      
         for k, v in pairs(t) do   strict.defined[k] = true   rawset(_G, k, v)   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       `���    �      	         	strict.defined[k] = true   	rawset(_G, k, v)5�_�                             ����                                                                                                                                                                                                                                                                                                                                                V       `���    �              5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             `���     �              �                 setmetatable(_G, strict)5��