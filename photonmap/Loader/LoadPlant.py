
from photonmap import libphotonmap_core
from openalea.plantgl.all import * 
from openalea.lpy import Lsystem
from photonmap.Common.Outils import *
from photonmap import (
    Vec3,
    VectorUint,
    VectorFloat,
    PhotonMapping,
    UniformSampler,
)

#Objectif of this module is adding captors to the scene of Photon Mapping to calculate the received energy 
#Data is located in this directory: ./assets

def add_lpy_file_to_scene(
    scene: libphotonmap_core.Scene,
    filename: str,
    t: int,
    tr2shmap: dict,
    anchor: Vec3,
    scale_factor,
):
    """
    Adds the lpy mesh to the photonmapping scene.
    :param sc:
    :param filename:
    :param t:
    :param tr2shmap:
    :param anchor:
    :param scale_factor:
    :return:
    """
    lsystem = Lsystem(filename)
    lstring = lsystem.derive(lsystem.axiom, t)
    lscene = lsystem.sceneInterpretation(lstring)
    # Adding the model of plant
    return addPlantModel(lscene, Tesselator(), tr2shmap, scene, anchor, scale_factor)

#add plant model to Scene
def addPlantModel(
    lscene, tr, tr2shmap, sc: libphotonmap_core.Scene, anchor: Vec3, scale_factor
):
    ctr = 0
    list_sh_id = set()
    for sh in lscene:
        sh.apply(tr)
        mesh = tr.result
        mesh.computeNormalList()
        indexListSize = mesh.indexListSize()
        vertices = VectorFloat([])
        normals = VectorFloat([])
        ind = []
        maxi = 0
        for i in range(0, indexListSize):
            index = mesh.indexAt(i)
            typeF = mesh.faceSize(i)
            for j in range(0, typeF):
                if index[j] > maxi:
                    maxi = index[j]
        for k in range(0, maxi + 1):
            mvector = mesh.pointAt(k)
            vertices.append(mvector[0] / (scale_factor / 10) + anchor[0])
            vertices.append(mvector[1] / (scale_factor / 10) + anchor[1])
            vertices.append(mvector[2] / (scale_factor / 10) + anchor[2])
        for k in range(0, maxi + 1):
            nvector = mesh.normalAt(k)
            normals.append(nvector[0])
            normals.append(nvector[1])
            normals.append(nvector[2])

        idx = flatten(mesh.indexList)
        for i in idx:
            if len(ind) > 0:
                i += len(ind)
                ctr += 1
        ind.extend(idx)
        indices = VectorUint(ind)
        r = float(sh.appearance.diffuseColor().red) / 255.0
        g = float(sh.appearance.diffuseColor().green) / 255.0
        b = float(sh.appearance.diffuseColor().blue) / 255.0
        diffuse = Vec3(r, g, b)
        ambient_r = float(sh.appearance.ambient.red) / 255.0
        ambient_g = float(sh.appearance.ambient.green) / 255.0
        ambient_b = float(sh.appearance.ambient.blue) / 255.0
        ambient = Vec3(ambient_r, ambient_g, ambient_b)
        shininess = sh.appearance.shininess
        specular_r = float(sh.appearance.specular.red) / 255.0
        specular_g = float(sh.appearance.specular.green) / 255.0
        specular_b = float(sh.appearance.specular.blue) / 255.0
        specular = Vec3(specular_r, specular_g, specular_b)
        transparency = sh.appearance.transparency
        illum = 8  # to use the leaf bxdf

        refl = (r + g + b) / 3
        spec = (specular_r + specular_g + specular_b) / 3
        

        sc.addFaceInfos(
            vertices,
            indices,
            normals,
            diffuse,
            ambient,
            spec,
            shininess,
            transparency,
            illum,
            sh.name,
            1,
            refl,
            transparency,
            1.0 - shininess,
        )

        list_sh_id.add(sh.id)

        for _ in mesh.indexList:
            tr2shmap[ctr] = sh.id
            ctr += 1
    
    return list_sh_id

#add plant to a scene of PlantGL to visualize
def addPlantModelPgl(lscene, tr, sc, anchor: Vec3, scale_factor, shenergy = {}):
    ctr = 0
    pglScene = Scene()
    for sh in lscene:
        sh.apply(tr)
        mesh = tr.result
        mesh.computeNormalList()
        indexListSize = mesh.indexListSize()
        vertices = []
        maxi = 0
        for i in range(0, indexListSize):
            index = mesh.indexAt(i)
            typeF = mesh.faceSize(i)
            for j in range(0, typeF):
                if index[j] > maxi:
                    maxi = index[j]
        for k in range(0, maxi + 1):
            mvector = mesh.pointAt(k)
            vertices.append(Vector3((mvector[0] / (scale_factor / 10) + anchor[0]),
                            (mvector[1] / (scale_factor / 10) + anchor[1]),
                            (mvector[2] / (scale_factor / 10) + anchor[2])),
                            )

        idx = mesh.indexList
        
        tmpSh= Shape(TriangleSet(vertices, idx, mesh.normalList))
        tmpSh.appearance = sh.appearance

        #change color of plant follow energy
        if shenergy:
            max_energy = shenergy[max(shenergy, key=shenergy.get)]

            cur_sh_energy = 0
            if sh.id in shenergy:
                cur_sh_energy = shenergy[sh.id]

            ratio = cur_sh_energy / max_energy
            r = (int)(255 * ratio) 
            g = (int)(255 * ratio) 
            b = (int)(255 * ratio) 
            tmpSh.appearance = Material(ambient=Color3(r,g,b), diffuse=sh.appearance.diffuse)

        pglScene.add(tmpSh)


    return Scene([pglScene, sc])