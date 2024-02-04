const dataArr = [
  {
    gallery: "freecodecamp",
    ahref: "https://pikapipipi.github.io/drummachine",
    aalt: "drum machine",
    imgsrc: "./image/drummachine.png",
    title: "Drum Machine",
    caption: "Learning to interact with buttons and event handlers in React using useEffect for key presses and  execute specific code during component mount.",
    uploaddate: 20240204,
  },
  {
    gallery: "freecodecamp",
    ahref: "https://pikapipipi.github.io/markdownpreviewer",
    aalt: "markdown previewer",
    imgsrc: "./image/markdownpreviewer.png",
    title: "Markdown Previewer",
    caption: "Learning how to live rendering and copy functionality in React using the react-markdown library and Clipboard API.",
    uploaddate: 20240203,
  },
  {
    gallery: "freecodecamp",
    ahref: "https://pikapipipi.github.io/randomquote",
    aalt: "random quote",
    imgsrc: "./image/randomquote.png",
    title: "Random Quotes",
    caption: "Learning how to work with React library with conditional rendering and short circuit evaluation.",
    uploaddate: 20240129,
  },
  {
    gallery: "freecodecamp",
    ahref: "./cashregister/cashregister.html",
    aalt: "cash register",
    imgsrc: "./image/cashregister.png",
    title: "Cash Register",
    caption: "Learning how to work with floating point calculations.",
    uploaddate: 20240120,
  },
  {
    gallery: "freecodecamp",
    ahref: "index.html#homework",
    aalt: "webpage",
    imgsrc: "./image/webpage.png",
    title: "This Webpage",
    caption: "Learning how to work with DOM manipulation, object destructuring and data filtering.",
    uploaddate: 20231228,
  },
  {
    gallery: "freecodecamp",
    ahref: "./romannumeral/romannumeral.html",
    aalt: "roman numeral",
    imgsrc: "./image/romannumeral.png",
    title: "Roman Numeral Converter",
    caption: "Learning how to perform calculations based on user input.",
    uploaddate: 20231227,
  },
  {
    gallery: "freecodecamp",
    ahref: "./palindromechecker/palindromechecker.html",
    aalt: "palindrome",
    imgsrc: "./image/palindrome_checker.png",
    title: "Palindrome Checker",
    caption: "Learning how to validate user input.",
    uploaddate: 20231225,
  },
  {
    gallery: "freecodecamp",
    ahref: "./pokemonsearch/pokedex.html",
    aalt: "pokedex",
    imgsrc: "./image/pkm_search.png",
    title: "Pokemon Search",
    caption: "Learning how to fetch data from an external API.",
    uploaddate: 20231223,
  },
  {
    gallery: "gsuite",
    ahref: "https://docs.google.com/spreadsheets/d/1jAxTbayo7MX5IASvxjHtZvSFqblyEwvYhjz6c1ZzULA/edit?usp=sharing",
    aalt: "Google Sheets",
    imgsrc: "./image/chemical_search.png",
    title: "Sheets for Searching Inventory",
    caption: "Aim to find any items in a second. Delighted it's still looked after by my old labmates.",
    uploaddate: 20220830,
  },
  {
    gallery: "gsuite",
    ahref: "https://sites.google.com/view/demoschedule/",
    aalt: "Apps Script",
    imgsrc: "./image/googlecalendar.png",
    title: "Google Sheets Apps Script",
    caption: "Batch upload list of events from spreadsheet to calendar.",
    uploaddate: 20220829,
  },
  {
    gallery: "gsuite",
    ahref: "https://sites.google.com/view/labtools",
    aalt: "Google Site",
    imgsrc: "./image/googlesite.png",
    title: "Google's Site",
    caption: 'A prototype for my labmates, and later handed to my colleagues.<a target="_blank" href="https://sites.google.com/study.hkmu.edu.hk/labtools/" alt="Google Site"><u>Click here for their site.</u></a>',
    uploaddate: 20220828,
  }

];
dataArr.sort((a, b) => a.uploaddate < b.uploaddate ? 1 : -1); // latest update display first
Object.freeze(dataArr);

const freecodecampHTML = document.getElementById("freecodecampgallery");
const gsuiteHTML = document.getElementById("gsuitegallery");

const setGalleryhw = (arr = dataArr, innerHTMLbyID) => {
  let galleryhwHTML = arr.map(
    ({ gallery, ahref, aalt, imgsrc, title, caption }) =>
      `<div class="galleryhw">
			<a href="${ahref}" alt="${aalt}"${gallery === 'gsuite' ? ' target="_blank"' : ''}>
				<img src="${imgsrc}"></a><br/>
        
					<span class="gallerytitle">
					<a href="${ahref}" alt="${aalt}"${gallery === 'gsuite' ? ' target="_blank"' : ''}>
          ${title}</a>
					</span>
				<span class="gallerycaption">
        ${caption}</span>
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


function AutoSmallerFont() {
  document.addEventListener('DOMContentLoaded', () => {
    const elems = [...document.querySelectorAll('.gallerycaption')];

    elems.forEach((caption) => {
      const isWrapped = caption.getClientRects().length > 3;
      if (isWrapped) {
        caption.style.fontSize = 'smaller';
      }
    });
  });
}
