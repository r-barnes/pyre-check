(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open Core

type t =
  | Ok
  | Error of string
  | Info of {
      (* All fields are required to implement `pyre servers` *)
      version: string;
      pid: int;
      socket: string;
      global_root: string;
      relative_local_root: string option;
    }
  | TypeErrors of Analysis.AnalysisError.Instantiated.t list
  | Query of Query.Response.t
[@@deriving sexp, compare, to_yojson]
