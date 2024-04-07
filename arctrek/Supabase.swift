//
//  Supabase.swift
//  arctrek
//
//  Created by Karen Zhao on 2024-04-06.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://xybfaozzukgnheeudlzo.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5YmZhb3p6dWtnbmhlZXVkbHpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0MzQzMDYsImV4cCI6MjAyODAxMDMwNn0.sjBatcvjHuNt3rBMH-sTzDbPhaoRITXJZdgO2ZddZxA"
)
