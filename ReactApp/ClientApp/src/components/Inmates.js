import React, { Component } from 'react';

export class Inmates extends Component {
    static displayName = Inmates.name;

    constructor(props) {
        super(props);
        this.state = { inmates: [], loading: true };
    }

    componentDidMount() {
        this.populateInmatesData();
    }

    static renderInmatesTable(inmates) {
        return (
            <table className='table table-striped' aria-labelledby="tabelLabel">
                <thead>
                    <tr>
                        <th>Inmate Name</th>
                        <th>Gender</th>
                        <th>Date Entered</th>
                        <th>Date Released</th>
                        <th>Drug Offender</th>
                    </tr>
                </thead>
                <tbody>
                    {inmates.map((inmateList, index) =>
                        <tr key={index}>
                            {
                                inmateList.map((inmate, subIndex) => 
                                <>
                                    <td key={subIndex}>{inmate.InmateName}</td>
                                    <td key={subIndex}>{inmate.Gender}</td>
                                    <td key={subIndex}>{inmate.DateEntered}</td>
                                    <td key={subIndex}>{inmate.DateReleased}</td>
                                    <td key={subIndex}>{inmate.DrugOffender}</td>
                                </>)
                            }      
                        </tr>
                    )}
                </tbody>
            </table>
        );
    }

    render() {
        let contents = this.state.loading
            ? <p><em>Loading</em></p>
            : Inmates.renderInmatesTable(this.state.inmates);

        return (
            <div>
                <h1 id="tableLabel">Inamtes</h1>
                <p>Inmates Details.</p>
                {contents}
            </div>
        );
    }

    async populateInmatesData() {
        const response = await fetch('/api/inmates');
        const data = await response.json();
        this.setState({ inmates: data, loading: false });
    }
}