open Core_kernel.Std
open Bap_types.Std
open Bap_image_std
open Bap_disasm_types
open Bap_disasm_abi

(** [insn mem basic] takes a basic instruction and a memory and
    returns a sequence of BIL statements. *)
val lift : mem -> ('a,'k) Basic.insn -> stmt list Or_error.t


module CPU : CPU

val register_abi : abi_constructor -> unit

val get_abi :
  ?all:bool -> (** defaults to false  *)
  ?image:image ->
  ?sym:string -> mem -> Bap_disasm_block.t -> abi list
