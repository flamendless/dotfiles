Vim�UnDo� �@:�U�����y֭�,v��tg#Z�R����+/      	            -       -   -   -    `iEz    _�                        
    ����                                                                                                                                                                                                                                                                                                                                                             `[�s    �                #include "modules/node.hpp"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `\��     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `\��     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `\��     �               7	void new_connection(const Connection& new_connection);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `\��     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `\��     �               6void new_connection(const Connection& new_connection);5�_�                       <    ����                                                                                                                                                                                                                                                                                                                                                             `\��     �               <void Node::new_connection(const Connection& new_connection);5�_�      	                 ;    ����                                                                                                                                                                                                                                                                                                                                                             `\��     �               ;void Node::new_connection(const Connection& new_connection)5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             `\��     �             �               {}5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             `\��    �      
       5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             `\��     �             �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `\��     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `\��     �               	�             5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                             `\��     �               (	m_connections.push_back(new_connection)5�_�                            ����                                                                                                                                                                                                                                                                                                                            
   $       	   $       V   *    `\��    �                    3		in_node->m_connections.push_back(new_connection);   4		out_node->m_connections.push_back(new_connection);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `c�     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `c�     �               	void set_desc(char* desc);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `c�     �               void set_desc(char* desc);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `c�     �               void set_desc(char* desc)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `c�     �             �               {}5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `c�     �      
       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `c�    �               void set_desc(char* desc)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `c�    �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `c�    �               	�             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `c�     �      	         	�      	       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `c�     �      	         	std::strcpy()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `c"     �                	std::memcpy()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       `c"     �                	const char* new_desc;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       `c#     �               	�             5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                v       `c-     �      	         	�      	       5�_�      -                     ����                                                                                                                                                                                                                                                                                                                            	          	          v       `c1     �                	Node::m_desc5�_�          !       -           ����                                                                                                                                                                                                                                                                                                                                                v       `iEy    �      	         	�      	       5�_�      "       -   !           ����                                                                                                                                                                                                                                                                                                                                                v       `i;�     �               +u	std::string* str = new std::string(desc);5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                                                v       `i;�     �             �               3		in_node->m_connections.push_back(new_connection);   4		out_node->m_connections.push_back(new_connection);5�_�   "   %           #          ����                                                                                                                                                                                                                                                                                                                                                  V        `i;�     �                5�_�   #   &   $       %           ����                                                                                                                                                                                                                                                                                                                                                  V        `i<	     �              5�_�   %   +           &           ����                                                                                                                                                                                                                                                                                                                                                  V        `i<
   	 �                �               )	m_connections.push_back(new_connection);5�_�   &   ,   )       +          ����                                                                                                                                                                                                                                                                                                                                                  V        `iEm     �                5�_�   +               ,           ����                                                                                                                                                                                                                                                                                                                                                  V        `iEm     �      	       �      	              5�_�   &   *   '   +   )          ����                                                                                                                                                                                                                                                                                                                                                             `i<   
 �               *	std::string* str = new std::string(desc);5�_�   )               *          ����                                                                                                                                                                                                                                                                                                                                                  V        `iEk     �             �               	s   (td::string* str = new std::string(desc);5�_�   &   (       )   '           ����                                                                                                                                                                                                                                                                                                                                                  V        `i<     �                5�_�   '               (           ����                                                                                                                                                                                                                                                                                                                                                  V        `i<     �                   #include <string>5�_�   #           %   $           ����                                                                                                                                                                                                                                                                                                                                                  V        `i;�    �              5�_�              !               ����                                                                                                                                                                                                                                                                                                                                                             `c2    �               	�      	         	m_desc = str->c_str();5��