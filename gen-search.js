const fs = require('fs');
const Fuse = require('fuse.js')


let repofiles = JSON.parse(fs.readFileSync("data/repofiles.json"))
let mini_pictures = JSON.parse(fs.readFileSync("data/mini_pictures.json"))

let search = []

repofiles.forEach(file => {
    let img = mini_pictures.find(i => i.name.includes(file.name))
    search.push({
        name: file.name,
        filesize: file.size,
        path: file.path,
        img: img ? img.name : null
    })
});


fs.writeFileSync("source/repofiles.json", JSON.stringify(search))

const repofiles_index = Fuse.createIndex(['name', 'img'], search)

fs.writeFileSync('source/search_index.json', JSON.stringify(repofiles_index.toJSON()))