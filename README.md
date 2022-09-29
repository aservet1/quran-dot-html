# quran-dot-html
Quran reader in one single HTML file


Below should show most of the use cases for how you ask for surah / ayat.

![image](https://user-images.githubusercontent.com/54599694/189545930-3b412087-e355-4acd-ab83-fc9e97de7231.png)

The idea behind this is to have a Quran reader app in one single HTML file. The text of the Quran defined as a JavaScript object and is accessed through Javascript functions associated with the HTML textbox and buttons, but the point is to have one file that is easily portable and usable. Everything you need is encapsulated in one file that you can send around and share, put on a web server, or keep a local copy on your machine.

It also has the benefit of being all-frontend. I have a Bible web-app that is slightly more in depth than this one, but one feature is that whenever you ask for a passage, you have to ask the web server. While having a "get Bible verses" web service is cool, it's also annoying and feels wasteful to make a network request every time you need a verse, and not be able to do it offline / when you already have all of this loaded on to your device.

I also reeeeeally like the minimalism here. I will most likely come back and make it a little prettier with CSS, but this is so much better than bloated websites like BibleGateway with all that other stuff.
