const dataArr= [
    {
      gallery:"freecodecamp",
      ahref: "./pokemonsearch/pokedex.html",
      aalt:"pokedex",
      imgsrc: "./image/pkm_search.png",
      title: "Pokemon Search",
      caption: "Learning how to fetch data from an external API.",
	uploaddate: 20231223
    },
    {
      gallery:"freecodecamp",
      ahref: "./palindromechecker/palindromechecker.html",
      aalt:"palindrome",
      imgsrc: "./image/palindrome_checker.png",
      title: "Palindrome Checker",
      caption: "Learning how to validate user input, perform calculations based on that input.",
	uploaddate: 20231225},
    {
      gallery:"freecodecamp",
      ahref: "./romannumeral/romannumeral.html",
      aalt:"roman numeral",
      imgsrc: "./image/romannumeral.png",
      title: "Roman Numeral Converter",
      caption: "Learning how to validate user input, perform calculations based on that input.",
	uploaddate: 20231227
    },    {
      gallery:"freecodecamp",
      ahref: "index.html#homework",
      aalt:"webpage",
      imgsrc: "./image/webpage.png",
      title: "This Webpage",
      caption: "Learning how to work with DOM manipulation, object destructuring, and data filtering.",
	uploaddate: 20231228
	},
    {
      gallery:"gsuite",
      ahref: "https://docs.google.com/spreadsheets/d/1jAxTbayo7MX5IASvxjHtZvSFqblyEwvYhjz6c1ZzULA/edit?usp=sharing",
      aalt:"Google Sheets",
      imgsrc: "./image/chemical_search.png",
      title: "Sheets for Searching Inventory",
      caption: "Aim to find any items in a second. Delighted it's still looked after by my old labmates.",
	uploaddate: 20220830
    },
    {
      gallery:"gsuite",
      ahref: "https://sites.google.com/view/demoschedule/",
      aalt:"Apps Script",
      imgsrc: "./image/googlecalendar.png",
      title: "Google Sheets Apps Script",
      caption: "Batch upload list of events from spreadsheet to calendar.",
	uploaddate: 20220829
    },
    {
      gallery:"gsuite",
      ahref: "https://sites.google.com/view/labtools",
      aalt:"Google Site",
      imgsrc: "./image/googlesite.png",
      title: "Google's Site",
      caption: 'A prototype for my labmates, and later handed to my colleagues.<a target="_blank" href="https://sites.google.com/study.hkmu.edu.hk/labtools/" alt="Google Site"><u>Click here for their site.</u></a>',
	  uploaddate: 20220828
    }

];
dataArr.sort((a, b) => a.uploaddate < b.uploaddate ? 1 : -1); // latest update display first
Object.freeze(dataArr);

const freecodecampHTML = document.getElementById("freecodecampgallery");
const gsuiteHTML = document.getElementById("gsuitegallery");

const setGalleryhw = (arr = dataArr, innerHTMLbyID) => {
	  let galleryhwHTML = arr.map(
      ({ gallery, ahref, aalt, imgsrc, title, caption}) =>
        `<div class="galleryhw">
			<a href="${ahref}" alt="${aalt}">
				<img src="${imgsrc}"></a><br/>
					<span class="gallerytitle">
					<a href="${ahref}" alt="${aalt}">
						 ${title}</a>
					</span>
					<span class="gallerycaption">${caption}</span>
		</div>`
    ).join("");

	innerHTMLbyID.insertAdjacentHTML('beforeend', galleryhwHTML);
};

      setGalleryhw(
        dataArr.filter((dataArr) => dataArr.gallery === "freecodecamp")
      , freecodecampHTML);

      setGalleryhw(
        dataArr.filter((dataArr) => dataArr.gallery === "gsuite")
      , gsuiteHTML);

