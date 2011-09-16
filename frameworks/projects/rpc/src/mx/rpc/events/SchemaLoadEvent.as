////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2006-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.rpc.events
{

import flash.events.Event;
import mx.rpc.xml.Schema;

[ExcludeClass]

/**
 * This event is dispatched when an XML Schema has loaded sucessfully.
 * 
 * @private
 */
public class SchemaLoadEvent extends XMLLoadEvent
{
    /**
     * Creates a new SchemaLoadEvent.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function SchemaLoadEvent(type:String, bubbles:Boolean = false, 
        cancelable:Boolean = true, schema:Schema = null, location:String = null)
    {
        super(type == null ? LOAD : type,
            bubbles,
            cancelable,
            schema == null ? null : schema.xml,
            location);

        this.schema = schema;
    }

    /**
     * The full Schema document.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public var schema:Schema;

    /**
     * Returns a copy of this SchemaLoadEvent.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    override public function clone():Event
    {
        return new SchemaLoadEvent(type, bubbles, cancelable, schema, location);
    }

    /**
     * Returns a String representation of this SchemaLoadEvent.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    override public function toString():String
    {
        return formatToString("SchemaLoadEvent", "location", "type", "bubbles",
            "cancelable", "eventPhase");
    }

    /**
     * A helper method to create a new SchemaLoadEvent.
     * @private
     */
    public static function createEvent(schema:Schema, location:String = null):SchemaLoadEvent
    {
        return new SchemaLoadEvent(LOAD, false, true, schema, location);
    }

    public static const LOAD:String = "schemaLoad";
}

}
