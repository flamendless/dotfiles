Vim�UnDo� b�u�����\���*��^�OT��}֋gc�                                     `��$    _�                             ����                                                                                                                                                                                                                                                                                                                                                             `���     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `���     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `���     �                #ifndef _NODE_BRANCH_HPP5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `���     �               #define _NODE_BRANCH_HPP5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             `���     �                 #endif //_NODE_BRANCH_HPP5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             `���     �      
         struct NodeBranch : public Node5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             `���     �               	explicit NodeBranch();5�_�      	                 	    ����                                                                                                                                                                                                                                                                                                                                                             `���     �               	inline ~NodeBranch() {}5�_�                 	          ����                                                                                                                                                                                                                                                                                                                                                             `���     �   
            &	NODE_KIND m_kind = NODE_KIND::BRANCH;5�_�   	      
                 ����                                                                                                                                                                                                                                                                                                                                                             `���     �                	bool m_has_else = false;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `���    �               	�             5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        `��#    �                	explicit NodeLoop();5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             `���     �              5��