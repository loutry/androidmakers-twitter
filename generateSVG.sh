#! /bin/bash

GENERATED_SVG_DIR="twitter/svg"

tags=('first annonce' '2eme annonce' 'humain sharing' 'do it the 2019' 'coroutines' 'monitor' 'design' 'jetpack' 'history' 'lock it' 'tools for consensus' 'media' 'architecture' 'tools for achi' 'kotlin' 'last')

speakers1_one=('florina_muntenescu.jpg')
speakers1_two=()
speakers2_one=('rebecca_franks.jpg')
speakers2_two=()
speakers5_one=('fabien_devos.jpg' 'brian_plummer.jpg' 'david_fournier.jpg')
speakers5_two=('yannick_lemin.jpg' 'benjamin_monjoie.jpg')
speakers4_one=('lena_ndiaye.jpg' 'nick_butcher.jpg' 'pierre_crepieux.jpg')
speakers4_two=('jeremy_bartolomeubonze.jpg' 'xavierf_gouchet.jpg')
speakers3_one=('louis_cad.jpg' 'danny_preussler.jpg' 'jag_saund.jpg')
speakers3_two=('florina_muntenescu.jpg' 'yacine_rezgui.jpg')
speakers6_one=('pierre-yves_ricau.jpg' 'nicola_corti.jpg' 'jeroen_mols.jpg' 'doug_stevenson.jpg')
speakers6_two=()
speakers7_one=('sebastiano_poggi.jpg' 'lorica_claesson.jpg')
speakers7_two=('nick_butcher.jpg' 'alex_lockwood.jpg' 'juhani_lehtimäki.jpg' 'pierluigi_rufo.jpg')
speakers8_one=('marc_poppleton.jpg' 'eyal_lezmy.jpg' 'jose_alcerreca.jpg' 'anita_singh.jpg')
speakers8_two=('john_hoford.jpg' 'nicolas_roard.jpg')
speakers9_one=('florent_champigny.jpg' 'vadim_caen.jpg' 'cyril_mottier.jpg' 'ty_smith.jpg')
speakers9_two=()
speakers10_one=('adrien_grassein.jpg' 'michael_ohayon.jpg' 'karapet_gyumjibashyanpmp.jpg')
speakers10_two=('hoi_lam.jpg' 'jonathan_salamon.jpg')
speakers11_one=('adrien_vitti.jpg' 'maria_neumayer.jpg' 'wojciech_dziemianczyk.jpg' 'marcos_holgado.jpg')
speakers11_two=()
speakers12_one=('etienne_caron.jpg' 'elaine_diasbatista.jpg' 'pierre-antoine_lafayette.jpg' 'hoi_lam.jpg' 'dupre_sandra.jpg')
speakers12_two=()
speakers13_one=('benoit_quenaudon.jpg' 'mounir_boudraa.jpg' 'ben_weiss.jpg')
speakers13_two=('simone_civetta.jpg' 'arnaud_piroelle.jpg')
speakers14_one=('martin_devillers.jpg' 'fred_porciúncula.jpg' 'arnaud_giuliani.jpg' 'magda_miu.jpg')
speakers14_two=()
speakers15_one=('david_gonzález.jpg' 'hugo_hache.jpg' 'julien_datour.jpg')
speakers15_two=('romain_guy.jpg' 'chet_haase.jpg')
speakers16_one=('bruno_verachten.jpg' 'roberto_orgiu.jpg' 'kai_koenig.jpg')
speakers16_two=('horacio_gonzalez.jpg' 'romain_rastel.jpg')

totalAnnonces=${#tags[*]}


# create model directory if it doesn't exist
mkdir -p ${GENERATED_SVG_DIR}

# empty or create generated svg directory
if [ -d ${GENERATED_SVG_DIR} ]; then
  rm -rf ${GENERATED_SVG_DIR}/*;
else
  mkdir -p ${GENERATED_SVG_DIR}
fi

templateFile="template.svg"

# generate svg from template with appropriate text
for (( i=0; i<=$(( $totalAnnonces -1 )); i++ ))
do

  annonceSvgFile=$GENERATED_SVG_DIR/annonce_${i}.svg
  label=$(echo ${tags[$i]} | sed -e 's/[\/&]/\\&amp;/g')
  # copy template file and replace content
  cp $templateFile $annonceSvgFile
  sed -i "" "s/ThisIsATag/${label}/g" $annonceSvgFile
  sed -i "" "s/annonce_002/annonce_${i}/g" $annonceSvgFile

  varArrayOne=speakers$((i+1))_one[@]
  for avatar in ${!varArrayOne}
  do
    sed -i "" "1,/defaultOne.jpg/ s/defaultOne.jpg/$avatar/g" $annonceSvgFile
    sed -i "" "1,/defaultOne.jpg/ s/defaultOne.jpg/$avatar/g" $annonceSvgFile
  done

  varArrayTwo=speakers$((i+1))_two[@]
  for avatar in ${!varArrayTwo}
  do
    sed -i "" "1,/defaultTwo.jpg/ s/defaultTwo.jpg/$avatar/g" $annonceSvgFile
    sed -i "" "1,/defaultTwo.jpg/ s/defaultTwo.jpg/$avatar/g" $annonceSvgFile
  done

done
DONE="SVG generated!"
echo $DONE
