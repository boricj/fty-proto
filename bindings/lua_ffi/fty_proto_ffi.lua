--------------------------------------------------------------------------------
--  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  -
--  Read the zproject/README.md for information about making permanent changes. -
--------------------------------------------------------------------------------

fty_proto_ffi = {}
fty_proto_ffi.ffi = require ("ffi")

-- typedefs simulating C standard library
-- see https://github.com/eliben/pycparser/blob/master/utils/fake_libc_include/_fake_defines.h
fty_proto_ffi.ffi.cdef [[
typedef struct __FILE FILE;
typedef int time_t;
typedef int off_t;
]]

-- czmq_prelude.h
fty_proto_ffi.ffi.cdef [[
typedef unsigned char byte;
typedef int SOCKET;
]]
fty_proto_ffi.ffi.cdef [[
typedef struct _fty_proto_t fty_proto_t;
typedef struct _zconfig_t zconfig_t;
typedef struct _zmsg_t zmsg_t;
typedef struct _zhash_t zhash_t;
typedef struct _zframe_t zframe_t;
// CLASS: fty_proto
// Create a new fty_proto
fty_proto_t *
    fty_proto_new (uint32_t id);

// Create a new fty_proto from zpl/zconfig_t *
fty_proto_t *
    fty_proto_new_zpl (zconfig_t *config);

// Destroy the fty_proto
void
    fty_proto_destroy (fty_proto_t **self_p);

// Parse a zmsg_t and decides whether it is fty_proto. Returns  
// true if it is, false otherwise. Doesn't destroy or modify the
// original message.                                            
bool
    fty_proto_is (zmsg_t *msg);

// Parse a fty_proto from zmsg_t. Returns a new object, or NULL if
// the message could not be parsed, or was NULL. Destroys msg and 
// nullifies the msg reference.                                   
fty_proto_t *
    fty_proto_decode (zmsg_t **msg_p);

// Encode fty_proto into zmsg and destroy it. Returns a newly created      
// object or NULL if error. Use when not in control of sending the message.
zmsg_t *
    fty_proto_encode (fty_proto_t **self_p);

// Receive and parse a fty_proto from the socket. Returns new object,
// or NULL if error. Will block if there's no message waiting.       
fty_proto_t *
    fty_proto_recv (void *input);

// Receive and parse a fty_proto from the socket. Returns new object,        
// or NULL either if there was no input waiting, or the recv was interrupted.
fty_proto_t *
    fty_proto_recv_nowait (void *input);

// Send the fty_proto to the output, and destroy it
int
    fty_proto_send (fty_proto_t **self_p, void *output);

// Send the fty_proto to the output, and do not destroy it
int
    fty_proto_send_again (fty_proto_t *self, void *output);

// Encode the METRIC
zmsg_t *
    fty_proto_encode_metric (zhash_t *aux, const char *type, const char *element_src, const char *value, const char *unit, uint32_t ttl);

// Encode the ALERT
zmsg_t *
    fty_proto_encode_alert (zhash_t *aux, const char *rule, const char *element_src, const char *state, const char *severity, const char *description, uint64_t time, const char *action);

// Encode the ASSET
zmsg_t *
    fty_proto_encode_asset (zhash_t *aux, const char *name, const char *operation, zhash_t *ext);

// Send the METRIC to the output in one step                    
// WARNING, this call will fail if output is of type ZMQ_ROUTER.
int
    fty_proto_send_metric (void *output, zhash_t *aux, const char *type, const char *element_src, const char *value, const char *unit, uint32_t ttl);

// Send the ALERT to the output in one step                     
// WARNING, this call will fail if output is of type ZMQ_ROUTER.
int
    fty_proto_send_alert (void *output, zhash_t *aux, const char *rule, const char *element_src, const char *state, const char *severity, const char *description, uint64_t time, const char *action);

// Send the ASSET to the output in one step                     
// WARNING, this call will fail if output is of type ZMQ_ROUTER.
int
    fty_proto_send_asset (void *output, zhash_t *aux, const char *name, const char *operation, zhash_t *ext);

// Duplicate the fty_proto message
fty_proto_t *
    fty_proto_dup (fty_proto_t *self);

// Print contents of message to stdout
void
    fty_proto_print (fty_proto_t *self);

// Export class as zconfig_t*. Caller is responsibe for destroying the instance
zconfig_t *
    fty_proto_zpl (fty_proto_t *self, zconfig_t *parent);

// Get the message routing id
zframe_t *
    fty_proto_routing_id (fty_proto_t *self);

// Set the message routing id
void
    fty_proto_set_routing_id (fty_proto_t *self, zframe_t *routing_id);

// Get the fty_proto id
int
    fty_proto_id (fty_proto_t *self);

// Set the fty_proto id
void
    fty_proto_set_id (fty_proto_t *self, int id);

// Return the printable command
const char *
    fty_proto_command (fty_proto_t *self);

// Get/set the aux field
zhash_t *
    fty_proto_aux (fty_proto_t *self);

// Get/set the aux field and transfer ownership to caller
zhash_t *
    fty_proto_get_aux (fty_proto_t *self);

// Get/set the aux field, transferring ownership from caller
void
    fty_proto_set_aux (fty_proto_t *self, zhash_t **aux_p);

// Get/set a value in the aux dictionary
const char *
    fty_proto_aux_string (fty_proto_t *self, const char *key, const char *default_value);

// Get/set a value in the aux dictionary
uint64_t
    fty_proto_aux_number (fty_proto_t *self, const char *key, uint64_t default_value);

// Get/set a value in the aux dictionary
void
    fty_proto_aux_insert (fty_proto_t *self, const char *key, const char *format, ...);

// Get/set a value in the aux dictionary
size_t
    fty_proto_aux_size (fty_proto_t *self);

// Get/set the type field
const char *
    fty_proto_type (fty_proto_t *self);

// Get/set the type field
void
    fty_proto_set_type (fty_proto_t *self, const char *format, ...);

// Get/set the element_src field
const char *
    fty_proto_element_src (fty_proto_t *self);

// Get/set the element_src field
void
    fty_proto_set_element_src (fty_proto_t *self, const char *format, ...);

// Get/set the value field
const char *
    fty_proto_value (fty_proto_t *self);

// Get/set the value field
void
    fty_proto_set_value (fty_proto_t *self, const char *format, ...);

// Get/set the unit field
const char *
    fty_proto_unit (fty_proto_t *self);

// Get/set the unit field
void
    fty_proto_set_unit (fty_proto_t *self, const char *format, ...);

// Get/set the ttl field
uint32_t
    fty_proto_ttl (fty_proto_t *self);

// Get/set the ttl field
void
    fty_proto_set_ttl (fty_proto_t *self, uint32_t ttl);

// Get/set the rule field
const char *
    fty_proto_rule (fty_proto_t *self);

// Get/set the rule field
void
    fty_proto_set_rule (fty_proto_t *self, const char *format, ...);

// Get/set the state field
const char *
    fty_proto_state (fty_proto_t *self);

// Get/set the state field
void
    fty_proto_set_state (fty_proto_t *self, const char *format, ...);

// Get/set the severity field
const char *
    fty_proto_severity (fty_proto_t *self);

// Get/set the severity field
void
    fty_proto_set_severity (fty_proto_t *self, const char *format, ...);

// Get/set the description field
const char *
    fty_proto_description (fty_proto_t *self);

// Get/set the description field
void
    fty_proto_set_description (fty_proto_t *self, const char *format, ...);

// Get/set the time field
uint64_t
    fty_proto_time (fty_proto_t *self);

// Get/set the time field
void
    fty_proto_set_time (fty_proto_t *self, uint64_t time);

// Get/set the action field
const char *
    fty_proto_action (fty_proto_t *self);

// Get/set the action field
void
    fty_proto_set_action (fty_proto_t *self, const char *format, ...);

// Get/set the name field
const char *
    fty_proto_name (fty_proto_t *self);

// Get/set the name field
void
    fty_proto_set_name (fty_proto_t *self, const char *format, ...);

// Get/set the operation field
const char *
    fty_proto_operation (fty_proto_t *self);

// Get/set the operation field
void
    fty_proto_set_operation (fty_proto_t *self, const char *format, ...);

// Get/set the ext field
zhash_t *
    fty_proto_ext (fty_proto_t *self);

// Get/set the ext field and transfer ownership to caller
zhash_t *
    fty_proto_get_ext (fty_proto_t *self);

// Get/set the ext field, transferring ownership from caller
void
    fty_proto_set_ext (fty_proto_t *self, zhash_t **ext_p);

// Get/set a value in the ext dictionary
const char *
    fty_proto_ext_string (fty_proto_t *self, const char *key, const char *default_value);

// Get/set a value in the ext dictionary
uint64_t
    fty_proto_ext_number (fty_proto_t *self, const char *key, uint64_t default_value);

// Get/set a value in the ext dictionary
void
    fty_proto_ext_insert (fty_proto_t *self, const char *key, const char *format, ...);

// Get/set a value in the ext dictionary
size_t
    fty_proto_ext_size (fty_proto_t *self);

// Self test of this class
void
    fty_proto_test (bool verbose);

]]

fty_proto_ffi.fty_proto = fty_proto_ffi.ffi.load ("libfty_proto")
return fty_proto_ffi
