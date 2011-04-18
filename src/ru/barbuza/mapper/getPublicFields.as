package ru.barbuza.mapper {
/**
 * @author Viktor Kotseruba <barbuzaster@gmail.com>
 */
function getPublicFields(cls:Object):Vector.<PublicField> {
  var fields:Vector.<PublicField> = new Vector.<PublicField>;
  for each (var variable:XML in Mapper.classDefinition(cls).factory.variable) {
    fields.push(new PublicField(variable.@name, variable.@type));
  }
  for each (var accessor:XML in Mapper.classDefinition(cls).factory.accessor.(@access == "writeonly" || @access == "readwrite")) {
    fields.push(new PublicField(accessor.@name, accessor.@type));
  }
  return fields;
}
}
