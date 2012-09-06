#! /bin/bash
#: Title       : Tenasform
#: Date        : 2011-12-05
#: Description : Starting from bone documents, blends them with 
#                pieces of html scattered in different html files


blend_eu(){
    for i in body_eu_*.html
    do
	f="$(echo "$i" | cut -d"_" -f3)"
	echo "Blending $i into $f"
	sed "/:-)main-body/{r $i
;d}" <bones_eu.azkuml | sed "/:-)news/{r news_eu.html
;d}" > "$f"
    done 
}
blend_es(){
    for i in body_es_*.html
    do
	f="$(echo "$i" | cut -d"_" -f3)"
	n="$(echo "$f" | cut -d"." -f1)es.html"

	echo "Blending $i into $n"
	sed "/:-)main-body/{r $i
;d}" <bones_es.azkuml | sed "/:-)news/{r news_es.html
;d}" > "$n"
    done 
}


while getopts ":h" i
do
    case $i in
        h)
            cat << EOF

                Starting from bone documents, blends them with 
                pieces of html scattered in different html files

-h     show this help 

EOF
            exit 0
            ;;
        f)
            FILENAME=$OPTARG
            ;;
        :)
            echo "Option -$OPTARG requires an argument.">&2
            exit 1
            ;;
        \?)
            echo "Parameter not defined $OPTARG" >&2
            exit 1
            ;;
        esac
done
blend_eu
blend_es