# Akira; A Technology Test of SwiftData and SwiftUI
### Or; "How I stopped worrying and learned to love the Bomb"###



####AppleScript is the Fruit of the Gods####
~
And alas we have forsaken _our_ ways.
~
TL;DR 
Anythig that a unix 10x leet güru can do in bash I have it all over in AppleScript. AAMOF, If I Recall Correctly that AppleScript Studio was one of Chris Lattner's early projects when he came onboard.
I do not expect that it will be around forever. 

I prefer my timestamps in a particular format YYYYMMDD@2359 which is 4-digits of Year, 2-digits of Month and Day and the Hours in 24-Hour format. I strongly prefer this as I _feel_ it is unambiguous. I ise it every log, ot journal entry, sometimes I inline it in a comment and see when I implemented a feature or made a design change. Ytping this is not har. A yimestamp is trivial.
~
_¿So, Why?_, why all the love ofr AppleScript. Well Chiefly because it is really a low level utility. Seriously it has its ROOTS way back in MacOS 7. That one that introduced Vitrual Memory and something else {in addition to ad-hoc networks, wsiwyg, multimedia… IDK} _Plus_ AppleScript. All of these are take for granted but AS still does some amazing things. I mean i Know it's less than 25 lines including comments and whitespace, but that includes error checking, formatting AND putting it on the clipboard
~
In this case I might save somewhere between 2-3 minutes a day, But that isn't the benefit at all. It is the one click and I am ready in note-taking before I even have the chance to get frustrated. Is that a benefit? Only if you really don't wnat to lose track of what you were thinking of _that *VERY* moment_
A task like this I could easily do in a shell script. I think my zsh config has date like that so it is easy to do. Now here is something interesting. I 'Could' run a `do shell script` with this awk pattern inside. But this had me thinking. I KNOW and see that AS is O-O has breakpoints and its own GUI\TK. Therefore before doing it good let me do it right.


20240721@2140

It is either the "failure of state" or the "state of failure" that is bugging TF out of me tonight. *_¡See!_* I had intended to deliver this demo onto my iPad, because once you do that on the cable you can do the rest OTA orin AitDrop. But when I got there the cupboard was bare and I was being asked to renew my ADC membership, for 105 dollars that I simply don't have. 
~
Now I ain't _really_ gonna let that burn me for more than a few hours as I decide a new plan. But in the meantime, (or immediate future - - in the post _above_ this) I will tell a funny tale of AppleScript.


20240721@0830

Last night I finally got some headway on this project. I am starting to feel like I did early in the CoreData days. This is a very very interesting toolkit because it really delivers on the "best line of code is the one you did't have to write" Cocoa mentality. To get this far in CoreData would heve taken at least 3 - 4 times as long and I would have to have spent a lot of time in Interface Builder. And while I don't hate IB. I certainly don't mind bypassing that whole Kabuki-Cabaret.
Anyway the next two steps are to add an "Events" entity and a photo for the user. Ooops THREE steps, there is the 'Renderer' object for the preview AND I also suspect that I will be refactoring the names of some classes and functions but that is a general part of Code Cleanup. I'm sure there are some nits-and-bits that reek of being written in the hella early A.M.

20240721@0020

So For What It's Worth (FWIW) AND it only makes me happy BUT I just made an AppleScript to generate this proper timestamp. Now that _begs the obvious question_ literally "Who even uses Applescript?" and while it took a little bit longer than I wanted it to. It is a function that I do everytime I write a log or jornal file. So wasting an hour to automate a task that is very easy to get sidetracked while doing is. Pretty Frickin' Rad.

20240720@2130

Well a Funny thing happened on the way to the Push for this, I added a stub for UnitTests. And it is *no criticizm of Youtube VDOs* BUT not mentioning neither Version Control nor Tests is bunk. 

20240720@0630

Yeah welcome to the land of Slagging Off. Well not really B/C of work and life and Lolz. But also, because no code should be wasted. I see this demo program as a good place to begin, however, I do not want to manually test it, and have to tape in *anybody's* given name or data. This is where I get to leverage a lot of old code from Cocoa and swift, so that I am actually factoring this project into something extendable and useful in the future, sort of future future proofing it before it's even written. This is both pre-refactoring and refactoring.
For example, I have Arrays of strings in the player class for names and such. I also have strings in the general UI and these should be localized. The names are abstract and genderless and that should be fixed. The RandomizePlayer functions should also be private Also these Arrays should be at the very least. It is not as if I want to type these out manually and then surface a bug to delete the third person's sub relations to @whereMet?, or @friendsOf?. These should certainly in Demo and Test Be utilized. they are cheap and reusable - - 

20240713@1830

Now I have added a basic implementation of SwiftData; It took a lot less time than it did going along with the YouTube Contend _However_ because I also refactored the names of the files inline it took longer than it will next time.
Still this is a vast improvement over;
1. >Doing it in XIB Files Top-Down with Dummy Data
2. >Adding persistence in JSON

20240713@1730

SO I have started from an Empty Repo that I scavanged from Github and had no project in it, it had my boilerplate ./.gitignore but not even this ReadMe.md
~
After Setting up a Blank iOS template I will add a few Droovy Directories for Resources, DataControllers and Views plus other DataEditors:UIView, possibly even a stub directory for external libs but that is getting ahead of things

20240713@1700

So I really have an affinity for Cocoa and CoreData. Hell I was even starting to like working with UIKit and these Dynamic Layouts and such. ~However my unit from ALL of my previous labs was KIA with all of my data and its replacement was both balky and unsuppoted/non-upgradeable {*yay*}.
~
Therefore if I would be starting from a relatively clean slate then it stands to reason that I should be willing and able to create an App using these two Key Technologies.
