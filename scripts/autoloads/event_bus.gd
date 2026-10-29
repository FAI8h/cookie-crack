extends Node

signal cracked(score : int)

signal main_menu
signal start_resume
signal game_over(score: int)
signal died

signal setting
signal time_left(sec : int)

signal combo()

#region Scene
signal progress_changed(progress)
signal load_finished

signal loading_screen_ready

#endregion Scene


signal start
signal pause
signal resume
signal retry
signal restart

#region testing stuff
signal god_mode

#endregion testing stuff


