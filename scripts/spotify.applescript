#!/usr/bin/osascript

on run cmd
	if (cmd = "next") then
		playNextTrack()
	else if (cmd = "prev") then
		playPrevTrack()
	else
		printCurrentlyPlayingTrack()
	end if
end run


on printCurrentlyPlayingTrack()
	set currentlyPlayingTrack to getCurrentlyPlayingTrack()
	do shell script "echo " & quoted form of currentlyPlayingTrack
end printCurrentlyPlayingTrack

on playNextTrack()
	tell application "Spotify"
		next track
	end tell
end playNextTrack

on playPrevTrack()
	tell application "Spotify"
		previous track
	end tell
end playPrevTrack

-- Method to get the currently playing track
on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentArtist to artist of current track as string
		set currentTrack to name of current track as string
		
		return currentArtist & " - " & currentTrack
	end tell
end getCurrentlyPlayingTrack

