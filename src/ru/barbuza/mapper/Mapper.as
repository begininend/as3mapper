package ru.barbuza.mapper {
import flash.utils.Dictionary;
import flash.utils.describeType;

/**
 * @author Viktor Kotseruba <barbuzaster@gmail.com>
 */
public class Mapper {

private static var definitionCache:Dictionary = new Dictionary();
private var val:Object;

public function Mapper(val:Object) {
  this.val = val;
}

public function to(target:Object):Object {
  if (isVector(target)) {
    return mapVector(val as Array, getVectorType(target));
  } else {
    return mapObject(val, target);
  }
}

public static function classDefinition(cls:Object):XML {
  if (definitionCache.hasOwnProperty(cls)) {
    return definitionCache[cls] as XML;
  }
  var definition:XML = describeType(cls);
  definitionCache[cls] = definition;
  return definition;
}
}
}
