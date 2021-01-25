
const IPFS = require('ipfs-core')
const fs = require('fs');
const { exit } = require('process')

async function main() {
    const node = await IPFS.create()

    let files = []

    for await (let file of node.ls('QmdNBzd1wCFK113qYLAw6gRCPujbh18tSZLsfL35HEZXSn')) {
        //console.log(file.name)
        files.push({
            name: file.name,
            filesize: file.size,
            path: file.path
        })
    }

    fs.writeFileSync("data/repofiles.json", JSON.stringify(files))

    let imgs = []

    for await (let file of node.ls('QmNNncnSzBbAcE92JwDH4rsemkdQvWReF5i2VynbxHcK8F')) {
        imgs.push({
            name: file.name,
            filesize: file.size,
            path: file.path
        })
    }

    fs.writeFileSync("data/mini_pictures.json", JSON.stringify(imgs))

    exit()
}

main()