Vim�UnDo� ���2�"O������@�q��c[�L��   (           
      C       C   C   C    `+7�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             `�H     �         (      #include "config.h"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `�I    �         (      #include "defines.h"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `��     �         (      namespace App5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `��     �         )      	�         (    5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             `��     �         *      		�         )    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `��     �         +    �         *      	{}5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  V        `��     �         ,      	struct App   	{       	}5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                            )                      V        `��     �                static SDL_Window* window;    static SDL_GLContext gl_context;   static ImGuiIO* imgui_io;       void init();   int init_app();   void init_window();   void init_imgui();   void update(bool& is_running);   void render_start();   void render_end();   void shutdown();5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  V        `��     �      )        �              5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            *           *           V        `��     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �      (   +      static SDL_Window* window;    static SDL_GLContext gl_context;   static ImGuiIO* imgui_io;       void init();   int init_app();   void init_window();   void init_imgui();   void update(bool& is_running);   void render_start();   void render_end();   void shutdown();5�_�                            ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �      !   +      	void init();5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �       "   +      	int init_app();5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �   !   #   +      	void init_window();5�_�                    #       ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �   "   $   +      	void init_imgui();5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �   #   %   +      	void update(bool& is_running);5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �   $   &   +      	void render_start();5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                       '           V        `��     �   %   '   +      	void render_end();5�_�                    '       ����                                                                                                                                                                                                                                                                                                                                       '           V        `��    �   &   (   +      	void shutdown();5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                  V        `��     �   (   *   +      }5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                  V        `��     �   (   *   +      };5�_�                    (       ����                                                                                                                                                                                                                                                                                                                                                  V        `��    �   '   )   +      }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `3�     �         +    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `3�     �         ,       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `3�     �         -       �         -    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `3�     �                #include "imgui_impl_opengl2.h"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `3�     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `3�     �                #include "imgui_impl_glfw.h"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `3�     �      
   +    �      	   +    5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             `3�    �                #include "imgui_impl_sdl.h"5�_�      !               	        ����                                                                                                                                                                                                                                                                                                                                                             `3�     �   	      +    5�_�       "           !   
        ����                                                                                                                                                                                                                                                                                                                                                             `3�     �   	      ,       �   
      ,    5�_�   !   #           "   
        ����                                                                                                                                                                                                                                                                                                                                                             `3�     �   	   
          #include <GLFW/glfw3.h>5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                                             `3�     �         +    �         +    5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                                  V        `3�    �                #include <SDL.h>   #include <SDL_opengl.h>5�_�   $   &           %           ����                                                                                                                                                                                                                                                                                                                                                  V        `4     �         +      	�         *    5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                  V        `4     �         +      	static �         +    5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                  V        `4     �         +      	static GLFWwindow* window5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                  V        `4     �                	static SDL_Window* window;5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                  V        `4"    �                !	static SDL_GLContext gl_context;5�_�   )   +           *           ����                                                                                                                                                                                                                                                                                                                                                             `4d     �         *      	�         )    5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                             `4k     �         *    5�_�   +   -           ,           ����                                                                                                                                                                                                                                                                                                                                                             `4l     �      !   +       �         +    5�_�   ,   .           -   "       ����                                                                                                                                                                                                                                                                                                                                                             `4n     �   !   #   .      	static void 5�_�   -   /           .   "   =    ����                                                                                                                                                                                                                                                                                                                                                             `4u     �   !   #   .      =	static void glfw_error_callback(int error, const char* desc)5�_�   .   0           /           ����                                                                                                                                                                                                                                                                                                                                                   V        `4v    �                Cstatic void glfw_error_callback(int error, const char* description)   {   ?    fprintf(stderr, "Glfw Error %d: %s\n", error, description);   }5�_�   /   1           0   	       ����                                                                                                                                                                                                                                                                                                                                                  V        `4�    �      
   *      #include "fmt/printf.h"5�_�   0   2           1   #        ����                                                                                                                                                                                                                                                                                                                                                  V        `6�   	 �   "   #          &	static void update(bool& is_running);5�_�   1   3           2   $        ����                                                                                                                                                                                                                                                                                                                                                             `"0X     �   $   &   *      	�   $   &   )    5�_�   2   4           3   %       ����                                                                                                                                                                                                                                                                                                                                                             `"0a     �   $   &   *      	static void update(double dt)5�_�   3   5           4   %       ����                                                                                                                                                                                                                                                                                                                                                             `"0b     �   $   %          	static void update(double dt);5�_�   4   6           5   "       ����                                                                                                                                                                                                                                                                                                                                                             `"0b   
 �   "   $   )    �   "   #   )    5�_�   5   7           6   #        ����                                                                                                                                                                                                                                                                                                                                                             `"0~    �   "   #          	static void update(double dt);5�_�   6   8           7          ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �         )      	static GLFWwindow* window;5�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �         )      	static ImGuiIO* imgui_io;5�_�   8   :           9          ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �         )      >	static void glfw_error_callback(int error, const char* desc);5�_�   9   ;           :          ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �          )      	static void init();5�_�   :   <           ;           ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �      !   )      	static int init_app();5�_�   ;   =           <   !       ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �       "   )      	static void init_window();5�_�   <   >           =   "       ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �   !   #   )      	static void init_imgui();5�_�   =   ?           >   #       ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �   "   $   )      	static void render_start();5�_�   >   @           ?   $       ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �   #   %   )      	static void render_end();5�_�   ?   A           @   %       ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �   $   &   )      	static void shutdown();5�_�   @   B           A          ����                                                                                                                                                                                                                                                                                                                                                             `+6�     �         )      	GLFWwindow* window;5�_�   A   C           B      
    ����                                                                                                                                                                                                                                                                                                                                                             `+6�    �         )      	ImGuiIO* imgui_io;5�_�   B               C           ����                                                                                                                                                                                                                                                                                                                                                             `+7�    �                7	void glfw_error_callback(int error, const char* desc);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `��     �         (      	�         )      struct init_app(){}5��