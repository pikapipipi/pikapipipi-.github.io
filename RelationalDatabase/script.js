const dataArr = [
  {
    gallery: "relationaldatabase",
    ahref: "https://github.com/pikapipipi/pikapipipi.github.io/tree/main/RelationalDatabase/PeriodicTable",
    aalt: "Number Guessing Game",
    imgsrc: "./image/numberguessing.png",
    title: "Number Guessing Game",
    caption: "Practice utilising Bash scripting, PostgreSQL, and Git to create a mini game that operates in the terminal.",
    uploaddate: 20240401,
  },
  {
    gallery: "relationaldatabase",
    ahref: "https://github.com/pikapipipi/pikapipipi.github.io/tree/main/RelationalDatabase/PeriodicTable",
    aalt: "Periodic Table Database",
    imgsrc: "./image/periodictable.png",
    title: "Periodic Table Database",
    caption: "Learning the basic concepts of how Git keeps track of code, and exploring further on Bash program by creating objects containing commonly used commands for PostgreSQL.",
    uploaddate: 20240330,
  },
  {
    gallery: "relationaldatabase",
    ahref: "https://github.com/pikapipipi/pikapipipi.github.io/tree/main/RelationalDatabase/SalonAppointment",
    aalt: "Salon Appointment Scheduler",
    imgsrc: "./image/salon.png",
    title: "Salon Appointment Scheduler",
    caption: "Learning to develop an interactive Bash program that stores information with PostgreSQL and queries the database for statistics.",
    uploaddate: 20240324,
  },
  {
    gallery: "relationaldatabase",
    ahref: "https://github.com/pikapipipi/pikapipipi.github.io/tree/main/RelationalDatabase/WorldCup",
    aalt: "World Cup Database",
    imgsrc: "./image/worldcup.png",
    title: "World Cup Database",
    caption: "Learning Bash scripting and utilising SQL to read and write information, with the use of SQL join commands to combine information from multiple tables.",
    uploaddate: 20240314,
  },
  {
    gallery: "relationaldatabase",
    ahref: "https://github.com/pikapipipi/pikapipipi.github.io/blob/main/RelationalDatabase/CelestialBodies/universe.sql",
    aalt: "Celestial Bodies Database",
    imgsrc: "./image/universe.png",
    title: "Celestial Bodies Database",
    caption: "Learning basics of a relational database by PostgreSQL",
    uploaddate: 20240303,
  }
];
dataArr.sort((a, b) => a.uploaddate < b.uploaddate ? 1 : -1); // latest update display first
Object.freeze(dataArr);

const relationaldatabaseHTML = document.getElementById("relationaldatabasegallery");

const setGalleryhw = (arr = dataArr, innerHTMLbyID) => {
  let galleryhwHTML = arr.map(
    ({ gallery, ahref, aalt, imgsrc, title, caption }) =>
      `<div class="galleryhw">
			<a href="${ahref}" alt="${aalt}" target="_blank">
				<img src="${imgsrc}"></a><br/>
        
					<span class="gallerytitle">
					<a href="${ahref}" alt="${aalt}"" target="_blank">
          ${title}</a>
					</span>
				<span class="gallerycaption">
        ${caption}</span>
		</div>`
  ).join("");

  innerHTMLbyID.insertAdjacentHTML('beforeend', galleryhwHTML);
};

setGalleryhw(
  dataArr.filter((dataArr) => dataArr.gallery === "relationaldatabase")
  , relationaldatabaseHTML);



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
