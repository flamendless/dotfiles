Vim�UnDo� i���-g��\��!�s�xw��@�s���u��k  F   			Assessments::is_open = true;           8       8   8   8    `��    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             `���     �   �   �  /      3	ImGui::SetNextWindowSize(Config::Sidebar_c::size);5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             `��      �   �   �  /      '	ImGui::SetNextWindowSize(Config::win);5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             `��     �   �   �  /      "	ImGui::SetNextWindowSize(ImVec2);5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             `��     �   �   �  0      	�   �   �  /    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             `��0     �   �   �  0      	ImVec2 size(Config::win_width)5�_�                    �   :    ����                                                                                                                                                                                                                                                                                                                                                             `��:     �   �   �  0      :	ImVec2 size(Config::Sidebar_c::width, Config::win_height)5�_�                    �   9    ����                                                                                                                                                                                                                                                                                                                                                             `��<    �   �   �  0      ;	ImVec2 size(Config::Sidebar_c::width, Config::win_height);5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             `��     �        0    �        0    5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             `��     �        1      Button* btn_docs;5�_�   	              
   ,        ����                                                                                                                                                                                                                                                                                                                            ,           *           V        `��     �   ,   .  1    5�_�   
                 -        ����                                                                                                                                                                                                                                                                                                                            ,           *           V        `��     �   -   1  2    �   -   .  2    5�_�                    .       ����                                                                                                                                                                                                                                                                                                                            .          .          v       `��     �   -   /  5      !	btn_docs = m_ui_buttons["docs"];5�_�                    .        ����                                                                                                                                                                                                                                                                                                                            .           .   #       v   #    `��     �   -   /  5      '	btn_assessment = m_ui_buttons["docs"];5�_�                    /       ����                                                                                                                                                                                                                                                                                                                            /          /          v       `��     �   .   0  5       	btn_docs->m_has_tooltip = true;5�_�                    0       ����                                                                                                                                                                                                                                                                                                                            0          0          v       `��     �   /   1  5      	btn_docs->m_tooltip = "Docs";5�_�                    0       ����                                                                                                                                                                                                                                                                                                                            0          0          v       `��    �   /   1  5      $	btn_assessment->m_tooltip = "Docs";5�_�                    0   (    ����                                                                                                                                                                                                                                                                                                                            0          0          v       `��     �   /   1  5      *	btn_assessment->m_tooltip = "Assessment";5�_�                    .   *    ����                                                                                                                                                                                                                                                                                                                            0          0          v       `��    �   -   /  5      -	btn_assessment = m_ui_buttons["assessment"];5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            0          0          v       `��     �   �   �  5    �   �   �  5    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            0          0          v       `��     �   �   �  6       		btn_docs->m_hoverable = false;5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  6    �   �   �  6    5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  @      	else if (Docs::is_open)5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  @      	else if (Assessment::is_open)5�_�                   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  @    �   �   �  @    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  A      		btn_docs->m_hoverable = true;5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  A      		btn_docs->m_hoverable = true;5�_�                   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  A    �   �   �  A    5�_�                     �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  B    �   �   �  B    5�_�      !               �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  C    �   �   �  C    5�_�       "           !   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �     D    �   �   �  D    5�_�   !   #           "   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��    �   �     E      		btn_docs->m_is_open ||5�_�   "   $           #         ����                                                                                                                                                                                                                                                                                                                                              V        `��     �      E    5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                              V        `��     �       F    �      F    5�_�   $   &           %         ����                                                                                                                                                                                                                                                                                                                                              V        `��     �      I      		btn_docs->draw();5�_�   %   '           &         ����                                                                                                                                                                                                                                                                                                                                              V        `��     �      I      .		if (!m_has_opened && btn_docs->m_is_clicked)5�_�   &   (           '         ����                                                                                                                                                                                                                                                                                                                                              V        `��    �       I      			Docs::is_open = true;5�_�   '   )           (  D        ����                                                                                                                                                                                                                                                                                                                                              V        `��     �  C  D           5�_�   (   *           )  E        ����                                                                                                                                                                                                                                                                                                                                              V        `��    �  D  E           5�_�   )   +           *           ����                                                                                                                                                                                                                                                                                                                                              V        `�     �      	  G    �        G    5�_�   *   ,           +           ����                                                                                                                                                                                                                                                                                                                                              V        `�    �                !#include "modules/filesystem.hpp"5�_�   +   -           ,           ����                                                                                                                                                                                                                                                                                                                                              V        `��     �        G    �        G    5�_�   ,   .           -           ����                                                                                                                                                                                                                                                                                                                                              V        `��    �                #include "ui/docs.hpp"5�_�   -   /           .           ����                                                                                                                                                                                                                                                                                                                                                             `�H     �        G    �        G    5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                             `�J     �        H      #include "ui/docs.hpp"5�_�   /   1           0          ����                                                                                                                                                                                                                                                                                                                                                             `�K   	 �        H      #include "ui/assocs.hpp"5�_�   0   2           1   h       ����                                                                                                                                                                                                                                                                                                                            F          F          v       `��   
 �   g   h          0		PLOGV << "Loaded successfully: " << key_hover;5�_�   1   3           2   ]       ����                                                                                                                                                                                                                                                                                                                            ]          ]          V       `��    �   \   ^          *		const std::string& key_hover = p2.first;5�_�   2   4           3   O        ����                                                                                                                                                                                                                                                                                                                            ]          ]          V       `�    �   O   Q  H      		�   O   Q  G    5�_�   3   5           4   P        ����                                                                                                                                                                                                                                                                                                                            ^          ^          V       `�=    �   O   P          		PLOGW << filename;5�_�   4   6           5   r        ����                                                                                                                                                                                                                                                                                                                            ]          ]          V       `�]    �   q   r           5�_�   5   7           6   /   +    ����                                                                                                                                                                                                                                                                                                                            ]          ]          V       `�x    �   .   0  F      .	btn_assessment = m_ui_buttons["assessments"];5�_�   6   8           7   �   
    ����                                                                                                                                                                                                                                                                                                                            ]          ]          V       `��     �   �   �  F      	else if (Assessments::is_open)5�_�   7               8         ����                                                                                                                                                                                                                                                                                                                            ]          ]          V       `��    �      F      			Assessments::is_open = true;5�_�                   .   *    ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   -   /  A      -	btn_assessment = m_ui_buttons["assessment"];5�_�                     0   (    ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   /   1  A      *	btn_assessment->m_tooltip = "Assessment";5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       `��     �   �   �  @    �   �   �  @      		btn_docs->m_hoverable = true;5��