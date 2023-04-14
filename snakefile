#IDS = "training-session-2019-05-25-3521136372-8ef0f25d-7439-4d93-b6c2-868567f839b0 training-session-2019-05-30-3535246547-97adbb80-67f4-48ab-9ea2-97e8e431f067 training-session-2019-06-02-3544115507-63fb767c-756b-4c9c-9b94-3b81472a32b6 training-session-2019-06-05-3554597496-a1d2e09d-d91a-4253-b89f-f450a0480d64 training-session-2019-06-13-3577732956-6c7aa9a9-687e-4e52-ae8d-c83309f6e0cb training-session-2019-06-14-3580501701-971f3c35-2fd0-4e13-b539-4456353e3944 training-session-2019-06-17-3589354986-5448fc35-7286-4c9c-b17b-f376959ef9ea training-session-2019-06-21-3601473746-5585b380-6cd2-42d3-b9d5-f972c807730b training-session-2019-06-21-3601644971-1fc87a0b-a032-48a4-bfe6-31f59bf4a000 training-session-2023-02-04-7574361079-4f97e571-5ae8-489c-89b8-5c6ac5b5530b training-session-2023-02-04-7574397011-2327cd05-61f3-4b49-b274-cbed32e3e312 training-session-2023-02-05-7574997422-a707337e-1ee0-4fc8-a708-6f253da27ea4 training-session-2023-02-05-7575036530-abbe5e9f-b896-494a-bdd8-3edcda80e456".split() # the list of desired ids
# a pseudo-rule that collects the target files
rule all:
#    input: expand("Training/{id}.json", id=IDS)
    output: "output/ultranew.json"
    shell: "bash/jq.sh > {output}"

rule StartTime:
    input: "output/ultranew.json"
    output: "TextFiles/duration.txt"
    shell: "bash/duration.sh {input} > {output}" 

rule Sed:
    input: "TextFiles/duration.txt"
    output: "TextFiles/duration2.txt"
    shell: "sed 's/[^0-9.]*//g' {input} > {output}"

rule HeartRateMax:
    input: "output/ultranew.json"
    output: "TextFiles/heartratemax.txt"
    shell: "bash/heartratemax.sh {input} > {output}"

rule HeartRateMin:
    input: "output/ultranew.json"
    output: "TextFiles/heartratemin.txt"
    shell: "bash/heartratemin.sh {input} > {output}"

rule HeartRateAvg:
    input: "output/ultranew.json"
    output: "TextFiles/heartrateavg.txt"
    shell: "bash/heartrateavg.sh {input} > {output}"

rule Date:
    input: "output/ultranew.json"
    output: "TextFiles/date.txt"
    shell: "bash/datetime.sh {input} > {output}"

rule Sedtwo:
    input: "TextFiles/date.txt"
    output: "TextFiles/date2.txt"
    shell: "sed 's/T.*//' {input} > {output}"

rule Sedthree:
    input: "TextFiles/date2.txt"
    output: "TextFiles/date3.txt"
    shell: "sed 's/^.//' {input} > {output}"

rule kiloCalories:
    input: "output/ultranew.json"
    output: "TextFiles/kilocalories.txt"
    shell: "bash/kilocalories.sh {input} > {output}"

rule Name:
    input: "output/ultranew.json"
    output: "TextFiles/name.txt"
    shell: "bash/name.sh {input} > {output}"

rule Sedfour:
    input: "TextFiles/name.txt"
    output: "TextFiles/name2.txt"
    shell: "sed 's/^.//' {input} > {output}"

rule Sedfive:
    input: "TextFiles/name2.txt"
    output: "TextFiles/name3.txt"
    shell: "sed 's/.$//' {input} > {output}"

rule paste:
    input: "TextFiles/date3.txt", "TextFiles/name3.txt", "TextFiles/kilocalories.txt","TextFiles/duration2.txt", "TextFiles/heartratemax.txt", "TextFiles/heartratemin.txt", "TextFiles/heartrateavg.txt"
    output: "TextFiles/Final.txt"
    shell: "paste {input[0]} {input[1]} {input[2]} {input[3]} {input[4]} {input[5]} {input[6]} | pr -t > {output}"

rule headers:
    input: "TextFiles/Final.txt"
    output: "TextFiles/CompleteFinal.txt"
    shell: "sed -i '1i Date Name KiloCalories Duration HeartRateMax HeartRateMin HeartRateAvg' {input}"

rule RScript:
    input: 
        txt = "TextFiles/Final.txt"
#    output: 
    script: "R/Analysis.R"
