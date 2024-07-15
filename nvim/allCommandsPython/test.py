import json

key = "EX_commands"

with open("input.txt", "r") as file:
    input_text = file.read()

data_list = []
lines = input_text.strip().split('\n')
for line in lines:
    if line == "":
        continue
    lineList = [element for element in line.split("\t") if element != ""]
    if len(lineList) > 3:
        temp = lineList[2]
        for element in lineList[3:]:
            temp = temp + " " + element
        lineList[2] = temp
        data_list = data_list[:3]
    if len(lineList) == 2:
        if lineList[0].strip().startswith('|'):
            lineList.append("")
        else:
            lineList.insert(0, "")
    if len(lineList) == 1:
        data_list[-1][2] = data_list[-1][2] + " " + lineList[0]
        continue
    lineList[0] = lineList[0].replace("|", "")
    if lineList[2].strip().startswith("1") or lineList[2].strip().startswith("2"):
        lineList[2] = lineList[2].strip()[1:]
    for index, element in enumerate(lineList):
        lineList[index] = element.strip()
    data_list.append(lineList)


for item in data_list:
    print(item)

if True:
    with open("result.json", "r") as file:
        data = json.load(file)
    if data != None:
        data[key] = data_list
    else:
        data = {key: data_list}
    with open("result.json", "w") as file:
        json.dump(data, file, indent=4)
