---
layout: post
title:  "Sound Spectrum Draft"
date:   2021-04-6 12:21:16 -0500
categories: jekyll update
---
# Aims
 
For Chapter 1 of my dissertation, I need to create a visualization that illustrates how Wordsworth's sound language oscilates from harmonic sounds, to silence, to discord. This is a draft of my sound spectrum visualization and it contains many errors, but it is a promising start. 


# Methods
After calculating my word frequencies, I manually sifted through the data to find locate all the sound words and metaphors mentioned. I then classified them by parts of speech and ranked them from strong harmony (1), to silentce (5.5), to discord (10). This process is imperfect, but I wanted to test how I should organzie my data to best illustrate sound. See below for data sample of my top 20 sound words. For the full list, see the Github page.

| Ranking | Word   | Frequency  | Sound Classification | Part of Speech |
|---------|--------|------------|----------------------|----------------|
| 138     | voic   | 1034       | 3                    | noun           |
| 175     | silent | 913        | 5.5                  | adjective      |
| 184     | said   | 887        | 3                    | verb           |
| 230     | hear   | 759        |                      | verb           |
| 238     | speak  | 739        | 3                    | verb           |
| 271     | song   | 660        | 1                    | noun           |
| 275     | quiet  | 642        | 5.5                  | adjective      |
| 279     | say    | 637        | 3                    | verb           |
| 281     | tell   | 635        | 3                    | verb           |
| 345     | ear    | 517        |                      | noun           |
| 447     | spake  | 394        | 3                    | verb           |
| 489     | told   | 362        | 3                    | verb           |
| 492     | voice  | 358        | 3                    | noun           |
| 509     | music  | 343        | 1                    | noun           |
| 543     | utter  | 315        | 3                    | verb           |
| 550     | rang   | 310        | 2                    | verb           |
| 586     | murmur | 283        | 3                    | verb           |
| 604     | loud   | 276        | 8                    | adjective      |
| 610     | silenc | 272        | 5.5                  | noun           |

I then loaded my dataset into Google Sheets to generate a basic bar chart of my data. 

# Drafted Visual

[Sound Spectrum Chart](https://docs.google.com/spreadsheets/d/e/2PACX-1vTLTiigPVJgoRgYyW7f9GotGkHRe6-q5LACl_MXSu-s536Y4jccPE3WWhYnYLEE-bfdkkJDOJt4pnyV/pubchart?oid=2023847379&format=interactive)

# Next Steps

- I still need to finish cleaning the plaintext files and tightening the stemming results in R so that I don't have any misspellings and/or duplicated root-words.
- I will need to find a way to condense my data to a more readable chart, rather than showing all the data points. 

