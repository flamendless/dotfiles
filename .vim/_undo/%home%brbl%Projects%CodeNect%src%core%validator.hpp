Vim�UnDo� ԏ��"�p'�8������$�� ��ȝ%�S�ɛj   
                                  `X�   	 _�                             ����                                                                                                                                                                                                                                                                                                                                                             `Q��     �         )      <inline std::map<const std::string, bool> m_reserved_keywords5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��     �                {   	{"bool", true},   	{"int", true},   	{"float", true},   	{"double", true},   	{"string", true},   	{"char", true},   };5�_�                       5    ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��     �         !      5std::map<const std::string, bool> m_reserved_keywords5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��     �         !      6std::map<const std::string, bool> m_reserved_keywords;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��     �         !      =static std::map<const std::string, bool> m_reserved_keywords;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��     �                <static std::map<const td::string, bool> m_reserved_keywords;5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��    �                 5�_�      
          	           ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��     �                Tinline verex::verex expr_var_name = verex::verex().search_one_line().start_of_line()   @	.then("(_*)?[a-zA-Z]+(_*)?((_*[0-9a-zA-Z]+)*)?").end_of_line();5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  V        `Q�     �                 #include "verbalexpressions.hpp"5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                  V        `Q�    �                    #include <map>   #include "plog/Log.h"   #include "core/defines.hpp"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        `Q�     �                 5�_�                    
        ����                                                                                                                                                                                                                                                                                                                            
                      V        `Q�     �   	   
       	   $	if (m_reserved_keywords.count(str))   &		return RES_VARNAME_CONFLICT_KEYWORD;       $	bool res = expr_var_name.test(str);       
	if (!res)   		return RES_VARNAME_INVALID;       	return RES_VARNAME_VALID;5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            
           	           V        `Q�     �      	          {   }5�_�                            ����                                                                                                                                                                                                                                                                                                                            	           	           V        `Q�     �      	         -inline int validate_var_name(const char* str)5�_�                       &    ����                                                                                                                                                                                                                                                                                                                            	           	           V        `Q�    �      	         &int validate_var_name(const char* str)5�_�                            ����                                                                                                                                                                                                                                                                                                                            	           	           V        `Q�O     �      	       5�_�                            ����                                                                                                                                                                                                                                                                                                                            
           
           V        `Q�P     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                            	           	           V        `Q�Q     �      	         	�      	       5�_�                       *    ����                                                                                                                                                                                                                                                                                                                            
           
           V        `Q�`    �      	         *bool check_var_name_taken(const char* str)5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             `R�    �               namespace Validations5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `R�     �                #ifndef _VALIDATIONS_HPP5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `R�     �               #define _VALIDATIONS_HPP5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             `R�    �                 #endif //_VALIDATIONS_HPP5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `X�     �               namespace CodeNect5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `X�     �                namespace Validator5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `X�     �                {5�_�                     	        ����                                                                                                                                                                                                                                                                                                                                                             `X�   	 �      	          }5�_�              	              ����                                                                                                                                                                                                                                                                                                                                                  V        `Q��     �              5��