Tasks = new Mongo.Collection('tasks');

Tasks.allow({
    insert: function () { return true; },
    update: function () { return true; },
    remove: function () { return true; }
});