' Jasc Soccer Just Another Sensi Clone - by Pitto

'This program is free software; you can redistribute it and/or
'modify it under the terms of the GNU General Public License
'as published by the Free Software Foundation; either version 2
'of the License, or (at your option) any later version.
'
'This program is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'GNU General Public License for more details.
'
'You should have received a copy of the GNU General Public License
'along with this program; if not, write to the Free Software
'Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
'Also add information on how to contact you by electronic and paper mail.
'
'------------------------------------------------------------------------   
' a must
#include "fbgfx.bi"
#include "24bitcustomfont.bi"

'this is the language I use
Using FB
'oh yea, I like random numbers, They're so useful and funny! :)
randomize timer()

'MACROS#################################################################
'calculate angle between two points
#macro _abtp (x1,y1,x2,y2)
    -Atan2(y2-y1,x2-x1)
#endmacro

'INCLUDE ###############################################################
#include "consts.bi"
#include "enums.bi"
#include "types.bi"
#include "shared.bi"
#include "functions.bi"
#include "subs.bi"

'initializing and loading variables ---------------------
'---------------------------------------------------------
init_gfx()
'IMPORTANT: respect this order 1) load_behavior; 2) load_tact
load_behavior()
'load tactics
load_tact()
'load player sprites, pitch... and so on...
load_bitmap()
load_player_sprites()
'loads the teams
load_teams_list()
load_pitch_data()
'load user manual
	'Main menu
load_whole_txt_file("_data/UM_txt_Main_Menu.txt",  UM_txt_main_menu())
	'Tactic Editor
load_whole_txt_file("_data/UM_txt_tactic_editor.txt",  UM_txt_tactic_editor())

'---------------------------------------------------------
DO
	Select case Game_section
		'splashscreen
		case splashscreen
			'display splashscreen
			display_splashscreen()
		'MAIN MENU
		case main_menu
			'display main menu
			display_menu()
		'team editor
		case team_editor
			load_team_data_for_team_editor(Main_Menu_List_Teams(Main_menu_Team_0_selected).id)
			display_team_editor()
		'TACTIC EDITOR
		case tactic_editor
			init_pitch_dimensions(10, 10, 320, 320, 0)
			display_tactic_editor()
		case bhv_editor
			load_bhv_data_for_editor()
			init_pitch_dimensions(20, 60, 320, 384, 0)
			display_bhv_editor()
		'GAME
		case game
			load_player_sprites()
			'initalize the teams selected
			init_team_data()
			'initialize pitch dimensions
			init_pitch_dimensions(PITCH_X, PITCH_Y, PITCH_W, PITCH_H, _
						Main_menu_pitch_type_selected)
			'initialize the player proprietes for the match seleceted
			init_players_proprietes()
			'display the teams before the match
			display_teams()
			put_ball_on_centre()
			'initialize the Timer
			init_timing()
			'THE MATCH ITSELF####
			display_match()   '##
			'####################
		'ENDING CREDITS
		case credits
			'I wish aknowledege everyone
			draw_aknowledgements()
		'EXIT FROM THE MAIN GAME
		case exit_game
			exit do
	end select
LOOP
'remove bitmap data from memory
delete_bitmap()
END
