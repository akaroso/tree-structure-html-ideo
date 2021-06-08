<?php

namespace App\Http\Controllers;

use App\Models\Tree;
use Illuminate\Http\Request;

class TreeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      //  $trees = Tree::all();

       $trees  =  Tree::where('parentID',NULL)->get(); // tylko korzenie

      // $trees->children;

        return view('trees.index',compact('trees'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        $trees = Tree::all();
        return view('trees.create', compact('trees'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'text' => 'required|min:3|max:50',
        ]);

        $text = $request->input('text','Tree text');
        $id = $request->input('id',null);

        $tree = new Tree();
        $tree->text = $text;
        $tree->parentID = $id;

        if($id>0)
        {$parentree = Tree::findOrFail($id);
            $tree->depth = $parentree->depth+1;}
        $tree->save();

        $request->session()->flash('status','Element successfully created!');

        $trees = Tree::where('parentID',NULL)->get();
        return view('trees.index',compact('trees'));

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //tak na prawde ta funkcja bedzie tworzyc liscia dla danego drzewa, ale nie chce mi się tworzyć nowych routow
        $tree = Tree::findOrFail($id);
        return view('trees.show',compact('tree'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


    public function edit($id)
    {
        $tree = Tree::find($id);
        $trees = Tree::all();
        return view('trees.edit', compact('tree','trees'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'text' => 'required|min:3|max:50',
        ]);

        $parentID = $request->input('select','Tree text');
        $text = $request->input('text');
        $treeToUpdate = Tree::find($id);

        if($parentID == 'root'){
            $treeToUpdate->parentID = null;
        } else {
            $treeToUpdate->parentID = (int)$parentID;
            $pt = Tree::findOrFail($parentID);
            $treeToUpdate->depth = $pt->depth+1;
        }

        $treeToUpdate->text = $text;
        $treeToUpdate->save();

        $request->session()->flash('status','Element successfully edited!');

        $trees = Tree::where('parentID',NULL)->get();
        return view('trees.index',compact('trees'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $tree = Tree::findOrFail($id);
        $this->deleteChildren($tree);

        return redirect()->route('trees.index', ['trees' => Tree::all()]);
    }

    private function deleteChildren(Tree $tree){
        $treeChildren = $tree->children()->get();

        if(count($treeChildren)>0){
            foreach( $treeChildren as $t){
                $this->deleteChildren($t);
            }
        }
        $tree->delete();
    }



}
