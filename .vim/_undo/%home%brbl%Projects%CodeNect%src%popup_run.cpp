Vim�UnDo� �Hi?�墌+��F�FؙcBn��G6\���      		PopupRun::is_open = false;            ,       ,   ,   ,    `+1�   
 _�                             ����                                                                                                                                                                                                                                                                                                                                                             `* �    �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `* �     �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `* �     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `* �     �                  �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `* �     �             �                 {}5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `* �     �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `*!     �               void Popup_Run::draw()5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             `*!    �             �               {}5�_�      
           	      
    ����                                                                                                                                                                                                                                                                                                                                                             `*!    �         	      void Popup_Run::draw()5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �                 5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �         	      	�             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �      	   	    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �      
   
      	5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �      	          	ImGu5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �         	    �         	    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `*!�     �      	       5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            	          	          v       `*!�     �      
         F	ImGui::Begin("Project", &PopupProject::is_open, PopupProject::flags);5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            	          	   !       v       `*!�     �      
         B	ImGui::Begin("Run", &PopupProject::is_open, PopupProject::flags);5�_�                    	   .    ����                                                                                                                                                                                                                                                                                                                            	   .       	   4       v   1    `*!�     �      
         >	ImGui::Begin("Run", &PopupRun::is_open, PopupProject::flags);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `*!�     �               "		if (ImGui::BeginMenu("Project"))5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   !    `*!�     �               "			ImGui::MenuItem("New Project");5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   "    `*!�     �               #			ImGui::MenuItem("Open Project");5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   "    `*!�     �               #			ImGui::MenuItem("Save Project");5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `*!�    �                		PopupProject::is_open = false;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `*!�     �               			ImGui::MenuItem("New Run");5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `*!�     �               			ImGui::MenuItem("Compie");5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `*!�     �               			ImGui::MenuItem("Open Run");5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `*!�    �               			ImGui::MenuItem("Save Run");5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       `*#~     �             �             5�_�                             ����                                                                                                                                                                                                                                                                                                                                                v       `*#     �             5�_�      !                  
    ����                                                                                                                                                                                                                                                                                                                                                v       `*#�    �               #bool PopupProject::is_open = false;5�_�       "           !      )    ����                                                                                                                                                                                                                                                                                                                                                v       `*#�    �   
            :	ImGui::Begin("Run", &PopupRun::is_open, PopupRun::flags);5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                                                v       `+1l     �                bool PopupRun::is_open = false;5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                                v       `+1l    �                 5�_�   #   %           $   	       ����                                                                                                                                                                                                                                                                                                                                                v       `+1s     �      
         9	ImGui::Begin("Run", &PopupRun::is_open, Popup_c::flags);5�_�   $   &           %   	       ����                                                                                                                                                                                                                                                                                                                                                v       `+1t     �      
         4	ImGui::Begin("Run", &Run::is_open, Popup_c::flags);5�_�   %   '           &   	       ����                                                                                                                                                                                                                                                                                                                                                v       `+1w     �      
         /	ImGui::Begin("Run", &is_open, Popup_c::flags);5�_�   &   (           '   	       ����                                                                                                                                                                                                                                                                                                                                                v       `+1w     �      
         )	ImGui::Begin("Run", &is_open, c::flags);5�_�   '   )           (   	       ����                                                                                                                                                                                                                                                                                                                                                v       `+1w     �      
         (	ImGui::Begin("Run", &is_open, ::flags);5�_�   (   +           )   	       ����                                                                                                                                                                                                                                                                                                                                                v       `+1w   	 �      
         '	ImGui::Begin("Run", &is_open, :flags);5�_�   )   ,   *       +          ����                                                                                                                                                                                                                                                                                                                                                v       `+1�     �               		PopupRun::is_open = false;5�_�   +               ,          ����                                                                                                                                                                                                                                                                                                                                                v       `+1�   
 �               		Run::is_open = false;5�_�   )           +   *   	       ����                                                                                                                                                                                                                                                                                                                                                v       `+1�     �      
         0	ImGui::Begin("Run", &PopupRun::is_open, flags);5��