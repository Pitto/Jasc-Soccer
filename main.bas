' Jasc Soccer Just Another Sensi Clone - by Pitto

   'This program is distributed in the hope that it will be useful,
   'but WITHOUT ANY WARRANTY; without even the implied warranty of
   'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
   
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

'initialize gfx engine
init_gfx()
'IMPORTANT: respect this order 1) load_behavior; 2) load_tact
load_behavior()
'load tactics
load_tact()
'load player sprites, pitch... and so on...
load_bitmap()
'debug stuff
if (Debug) then
	'check if the correct loading of the tactic file
	dbg_display_tct_file_check()
	'check if the bitmaps have been correctly loaded
	check_bitmap()
end if
'loads the teams
load_teams_list()
load_pitch_data()
'display main menu
display_menu()
'initalize the teams
init_team_data()
'initialize the player proprietes for the match seleceted
init_players_proprietes()

put_ball_on_centre()
'initialize the Timer
init_timing()
'THE MATCH ITSELF####
display_match()   '##
'####################
'I wish aksnowledege everyone
draw_aknowledgements()
'remove bitmap data from memory
delete_bitmap()
END
