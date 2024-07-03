import cityData from "@/assets/json/pca-code.json";

// 城区级联选择器的参数
export const cityProps = {
    expandTrigger: 'hover',
    value:'code',   // 指定选项的 值 为选项对象的某个属性值
    label:'name',   // 指定选项 标签 为选项对象的某个属性值
    children:'children',    //指定选项的 子选项 为选项对象的某个属性值
    emitPath:false
}

const codeToNameMapping = {};

cityData.forEach(province => {
    province.children.forEach( city => {
        city.children.forEach( area => {
            const fullName = `${province.name}-${city.name}-${area.name}`;
            codeToNameMapping[area.code] = { code: area.code, name: fullName }
        })
    })
})

// 将城区的code转换为对应的名字
export const getCodeName = (code) => {
    return codeToNameMapping[code] ? codeToNameMapping[code].name : '未知';
};