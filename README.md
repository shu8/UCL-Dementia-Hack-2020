# Rewind (UCL Dementia Hack 2020)

This repo contains the code created for the [UCL Dementia Hack 2020](https://www.ucl.ac.uk/iccs/events/2020/feb/ucl-dementia-hack).

It is a journal-style mobile app created using [Flutter](https://flutter.dev).

The idea is to quiz users who are at-risk of having or have dementia on their own past, using entries they have written themselves.

Users can save textual, pictures, or audio content attached to each 'memory'.

## Features
- Rewind: a quiz with Easy, Medium, Hard levels asking questions on their past
- Memories: a way to add memories with text/images/videos/voice notes
- Activities: suggestions on what activities people could do to keep them active/socialising/etc.

## Implementation

The app uses Flutter and has an SQLite database storing the data. Media is saved in the app's own storage area.
