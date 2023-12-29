/*The stats*/
const pkmID = document.getElementById('pokemon-id');
const pkmName = document.getElementById('pokemon-name');

const types = document.getElementById('types');
const height = document.getElementById('height');
const weight = document.getElementById('weight');

const imageF = document.getElementById('imageF');
const imageB = document.getElementById('imageB');

const hp = document.getElementById('hp');
const attack = document.getElementById('attack');
const defense = document.getElementById('defense');
const spAtk = document.getElementById('special-attack');
const spDef = document.getElementById('special-defense');
const speed = document.getElementById('speed');

/*The input form*/
const searchForm = document.getElementById('search-form');
const searchInput = document.getElementById('search-input');

searchForm.addEventListener("submit", function (e) {
  e.preventDefault();
//get input value, slowpoke for testing
  var nameOrId = searchInput.value.toLowerCase();
//var nameOrId = "slowpoke";
  fetchData(nameOrId);
});


//get from API
const allPkmList = "https://pokeapi-proxy.freecodecamp.rocks/api/pokemon/";
const fetchData = async (nameOrId) => {
  try {

    const res = await fetch(`${allPkmList}${nameOrId}`);
    const data = await res.json();

    //tablePoke
    console.log(data)
    pkmName.innerHTML = `${data.name.toUpperCase()}`;
    pkmID.innerHTML = `#${data.id}`;
    weight.innerHTML = `Weight: ${data.weight} kg`;
    height.innerHTML = `Height: ${data.height/10} m`;
    imageF.innerHTML = `
      <img id="imageF" class="pkmimg" src="${data.sprites.front_default}" alt="${data.id} front">
    `;
    imageB.innerHTML = `
     <img id="imageB"  class="pkmimg" src="${data.sprites.back_default}" alt="${data.id} back"> `;

      types.innerHTML = data.types
      .map(obj => `<span class="type ${obj.type.name.toLowerCase()}">${obj.type.name.toUpperCase()}</span>`)
      .join('');

      //tableStats
      hp.innerHTML = `${data.stats[0].base_stat}`;
      attack.innerHTML = `${data.stats[1].base_stat}`;
      defense.innerHTML = `${data.stats[2].base_stat}`;
      spAtk.innerHTML = `${data.stats[3].base_stat}`;
      spDef.innerHTML = `${data.stats[4].base_stat}`;
      speed.innerHTML = `${data.stats[5].base_stat}`;

  } catch (err) {
  alert('Pokémon not found');
  fetchData('ditto');
  }
};
